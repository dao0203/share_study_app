import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/onboarding/login/login_page.dart';
import 'package:share_study_app/ui/view/timeline/thread_page.dart';

class AuthGate extends HookConsumerWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAuthRepository = ref.watch(userAuthRepositoryProvider);
    return userAuthRepository.isUserSignedIn() == true
        ? const QuestionsScreen()
        : const LoginPage();
  }
}
