import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/ui/state/splash_state.dart';
import 'package:share_study_app/app/share_study_app.dart';
import 'package:share_study_app/ui/view/onboarding/registration_profile/registration_profile_screen.dart';
import 'package:share_study_app/ui/view/onboarding/sign_in/sign_in_screen.dart';
import 'package:share_study_app/util/splash.dart';

class AuthGate extends HookConsumerWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashStateProvider);
    return splashState.when(
        data: (splashTo) {
          Logger().i(splashTo);
          switch (splashTo) {
            case SplashTo.signInScreen:
              return const SignInScreen();
            case SplashTo.profileScreen:
              return RegistrationProfileScreen();
            case SplashTo.homeScreen:
              return const ShareStudyApp();
          }
        },
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, stacktrace) {
          Logger().e({error, stacktrace});
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('エラーが発生しました'),
                  TextButton(
                    onPressed: () {
                      return ref.refresh(splashStateProvider);
                    },
                    child: const Text('再試行'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
