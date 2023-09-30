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
      Logger().d('follow.value: $value');
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
      Logger().d('unfollow.value: $value');
    }).catchError((error) {
      Logger().e('unfollow.error: $error');
      throw error;
    });
  }
}
