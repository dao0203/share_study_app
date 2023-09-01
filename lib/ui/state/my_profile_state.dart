import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';

part 'my_profile_state.g.dart';

@riverpod
class MyProfileState extends _$MyProfileState {
  @override
  Future<Profile> build() async {
    return ref.watch(getMyProfileUseCaseProvider).call(null);
  }
}
