import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class SupabaseProfileRepository implements ProfileRepository {
  final supabaseClient = Supabase.instance.client;
  @override
  Future<Profile> getProfile(String id) async {
    return await supabaseClient
        .from('profiles')
        .select('''
          id, nickname, image_url, bio, university_name, faculty_name, follow_count, follower_count,
          activities (question_count, answer_count, best_answer_count)
        ''')
        .eq('id', id)
        .limit(1)
        .single()
        .then((value) {
          Logger().d('getProfile.value: $value');
          return Profile(
            id: value['id'],
            nickname: value['nickname'] as String,
            imageUrl: value['image_url'] as String?,
            universityName: value['university_name'] as String,
            followCount: value['follow_count'] as int,
            followerCount: value['follower_count'] as int,
            questionCount: value['activities']['question_count'] as int,
            answerCount: value['activities']['answer_count'] as int,
            bestAnswerCount: value['activities']['best_answer_count'] as int,
            facultyName: value['faculty_name'] as String?,
            departmentName: value['department_name'] as String?,
            bio: value['bio'] as String?,
          );
        })
        .catchError((error, stackTrace) {
          Logger().e('getProfile.error: $error stackTrace: $stackTrace');
          throw error;
        });
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    Logger().d('updateProfile.profile: $profile');
    return await supabaseClient
        .from('profiles')
        .update({
          'nickname': profile.nickname,
          'university_name': profile.universityName,
          'faculty_name': profile.facultyName,
          'department_name': profile.departmentName,
          'bio': profile.bio,
        })
        .eq('id', profile.id)
        .whenComplete(() {
          Logger().d('updateProfile.profile: success update profile');
        })
        .catchError((error) {
          Logger().e('updateProfile.error: $error');
        });
  }

  @override
  Future<void> follow(String profileId) async {
    await supabaseClient.from('follows').insert({
      'following_profile_id': supabaseClient.auth.currentUser!.id,
      'followed_profile_id': profileId,
    }).then((value) {
      Logger().d('正常にフォローしました。');
    }).catchError((error) {
      Logger().e('follow.error: $error');
      throw error;
    });
  }

  @override
  Future<void> unfollow(String profileId) async {
    await supabaseClient
        .from('follows')
        .delete()
        .eq('followed_profile_id', profileId)
        .eq('following_profile_id', supabaseClient.auth.currentUser!.id)
        .then((value) {
      Logger().d('正常にフォローを解除しました。');
    }).catchError((error) {
      Logger().e('unfollow.error: $error');
      throw error;
    });
  }

  @override
  Future<bool> isFollowing(String profileId) {
    Logger().d('isFollowing.profileId: $profileId');
    return supabaseClient
        .from('follows')
        .select('followed_profile_id')
        .eq('followed_profile_id', profileId)
        .eq('following_profile_id', supabaseClient.auth.currentUser!.id)
        .limit(1)
        .then((value) {
      Logger().d('isFollowing.value: $value');
      return value != null && value.isNotEmpty;
    }).catchError((error) {
      Logger().e('isFollowing.error: $error');
      throw error;
    });
  }

  @override
  Future<List<Profile>> getFollowersWithPagination(
      String profileId, int start, int end) async {
    return await supabaseClient
        .from('follows')
        .select<PostgrestList>('''
      following_profile_id (id, nickname, image_url, bio, university_name, faculty_name, follow_count, follower_count)
    ''')
        .eq('followed_profile_id', profileId)
        .order('followed_at', ascending: false)
        .range(start, end)
        .then((value) {
          Logger().d('getFollowers.value: $value');
          return value
              .map((e) => Profile(
                    id: e['following_profile_id']['id'],
                    nickname: e['following_profile_id']['nickname'],
                    imageUrl: e['following_profile_id']['image_url'],
                    bio: e['following_profile_id']['bio'],
                    universityName: e['following_profile_id']
                        ['university_name'],
                    facultyName: e['following_profile_id']['faculty_name'],
                    followCount: e['following_profile_id']['follow_count'],
                    followerCount: e['following_profile_id']['follower_count'],
                  ))
              .toList();
        })
        .catchError((error) {
          Logger().e('getFollowers.error: $error');
          throw error;
        });
  }

  @override
  Future<List<Profile>> getFollowingWithpagination(
      String profileId, int start, int end) async {
    return await supabaseClient
        .from('follows')
        .select<PostgrestList>('''
      following_profile_id (id, nickname, image_url, bio, university_name, faculty_name, follow_count, follower_count)
    ''')
        .eq('following_profile_id', profileId)
        .range(start, end)
        .then((value) {
          Logger().d('getFollowing.value: $value');
          return value
              .map((e) => Profile(
                    id: e['following_profile_id']['id'],
                    nickname: e['following_profile_id']['nickname'],
                    imageUrl: e['following_profile_id']['image_url'],
                    bio: e['following_profile_id']['bio'],
                    universityName: e['following_profile_id']
                        ['university_name'],
                    facultyName: e['following_profile_id']['faculty_name'],
                    followCount: e['following_profile_id']['follow_count'],
                    followerCount: e['following_profile_id']['follower_count'],
                  ))
              .toList();
        })
        .catchError((error) {
          Logger().e('getFollowing.error: $error');
          throw error;
        });
  }
}
