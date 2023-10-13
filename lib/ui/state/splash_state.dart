import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';
import 'package:share_study_app/util/splash.dart';

part 'splash_state.g.dart';

@riverpod
class SplashState extends _$SplashState {
  @override
  Future<SplashTo> build() async {
    return await ref.watch(setUpSplashUseCaseProvider).call(param: null);
  }
}
