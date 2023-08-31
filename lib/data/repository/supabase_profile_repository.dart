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
        id: value.data['id'] as String,
        nickname: value.data['nickname'] as String,
        imageUrl: value.data['image_url'] as String?,
        universityName: value.data['university_name'] as String?,
        facultyName: value.data['faculty_name'] as String?,
        departmentName: value.data['department_name'] as String?,
        bio: value.data['bio'] as String?,
      );
    });
  }

  @override
  Future<void> updateProfile(Profile profile) {
    final userId = supabaseClient.auth.currentUser!.id;
    return supabaseClient.from('profiles').update({
      'nickname': profile.nickname,
      'image_url': profile.imageUrl,
      'university_name': profile.universityName,
      'faculty_name': profile.facultyName,
      'department_name': profile.departmentName,
      'bio': profile.bio,
    }).eq("id", userId);
  }
}
