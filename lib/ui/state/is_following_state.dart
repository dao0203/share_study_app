import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

part 'is_following_state.g.dart';

@riverpod
class IsFollowingState extends _$IsFollowingState {
  @override
  Future<bool> build(String profileId) {
    return ref.watch(profileRepositoryProvider).isFollowing(profileId);
  }
}
