import 'package:share_study_app/data/domain/profile.dart';

abstract interface class ProfileRepository {
  Future<Profile> getProfile(String id);
  Future<void> updateProfile(Profile profile);
}
