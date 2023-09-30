import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/domain/activity_profile.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';

part 'activity_profile_state.g.dart';

@riverpod
class ActivityProfileState extends _$ActivityProfileState {
  @override
  Future<ActivityProfile> build(String param) async {
    return ref.watch(getProfileUseCaseProvider).call(param);
  }

  void incrementFollowCount() async {
    state = const AsyncValue.loading();
    update((p0) => p0.copyWith(
        profile:
            p0.profile.copyWith(followCount: p0.profile.followCount! + 1)));
    state = AsyncValue.data(state.value!);
  }

  void decrementFollowCount() {
    state = const AsyncValue.loading();
    update((p0) => p0.copyWith(
        profile:
            p0.profile.copyWith(followCount: p0.profile.followCount! - 1)));
    state = AsyncValue.data(state.value!);
  }
}
