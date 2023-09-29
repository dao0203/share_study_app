import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/domain/activity_profile.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';

part 'activity_profile_state.g.dart';

@riverpod
class ActivityProfileState extends _$ActivityProfileState {
  @override
  FutureOr<ActivityProfile> build(String param) async {
    return ref.watch(getProfileUseCaseProvider).call(param);
  }
}
