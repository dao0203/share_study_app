import 'package:share_study_app/data/domain/profile.dart';

abstract interface class ProfileRepository {
  Future<Profile> getProfile(String id);
  Future<void> follow(String profileId);
  Future<void> unfollow(String profileId);
  Future<bool> isFollowing(String profileId);
  Future<bool> isBlocking(String profileId);
  Future<void> updateProfile(Profile profile, String? filePath);
  Future<List<Profile>> getFollowersWithPagination(
      String profileId, int start, int end);
  Future<List<Profile>> getFollowingWithpagination(
      String profileId, int start, int end);
  Future<void> block(String profileId);
  Future<void> unblock(String profileId);
}
