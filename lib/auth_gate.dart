import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/app/app_router.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';
import 'package:share_study_app/util/assets.gen.dart';
import 'package:share_study_app/util/splash.dart';

class AuthGate extends StatefulHookConsumerWidget {
  const AuthGate({super.key});
  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result =
          await ref.watch(setUpSplashUseCaseProvider).call(param: null);

      if (!mounted) {
        return;
      }

      switch (result) {
        case SplashTo.signInScreen:
          context.go(AppRouter.signIn);
          return;
        case SplashTo.profileScreen:
          context.go(AppRouter.registrationProfile);
          return;
        case SplashTo.timelineScreen:
          context.go(AppRouter.timeline);
          return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(myProfileStateProvider);
    return Scaffold(
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Assets.icons.appAdaptiveBackground.image(
            width: 200,
            height: 200,
          ),
          Assets.icons.appAdaptiveForeground.image(
            width: 340,
            height: 340,
          ),
        ],
      )),
    );
  }
}
