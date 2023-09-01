import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/domain/activity.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';

part 'my_activity_state.g.dart';

@Riverpod(keepAlive: true)
class MyActivityState extends _$MyActivityState {
  @override
  Future<Activity> build() async {
    return await ref.watch(getMyActivityUseCaseProvider)(null);
  }
}
