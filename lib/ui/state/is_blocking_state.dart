import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

part 'is_blocking_state.g.dart';

@riverpod
class IsBlockingState extends _$IsBlockingState {
  @override
  Future<bool> build(String profileId) {
    return ref.watch(profileRepositoryProvider).isBlocking(profileId);
  }
}
