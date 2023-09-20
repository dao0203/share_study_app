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
        .select()
        .eq('id', id)
        .limit(1)
        .single()
        .then((value) {
      return Profile(
        id: value['id'],
        nickname: value['nickname'] as String,
        imageUrl: value['image_url'] as String?,
        universityName: value['university_name'] as String,
        followCount: value['follow_count'] as int,
        followerCount: value['follower_count'] as int,
        facultyName: value['faculty_name'] as String?,
        departmentName: value['department_name'] as String?,
        bio: value['bio'] as String?,
      );
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
}
