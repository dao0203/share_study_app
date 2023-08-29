import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/auth_gate.dart';
import 'package:share_study_app/ui/theme/colors.dart';
import 'package:share_study_app/ui/view/onboarding/registration/register_page.dart';
import 'package:share_study_app/ui/view/privacy_policy/privacy_policy_web.dart';
import 'package:share_study_app/ui/view/timeline/thread_page.dart';

class ShareStudyApp extends HookConsumerWidget {
  const ShareStudyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "questions_screen": (context) => const QuestionsScreen(),
        RegisterPage.tag: (context) => const RegisterPage(),
        PrivacyPolicyWebPage.tag: (context) => const PrivacyPolicyWebPage(),
      },
      title: 'Share_study_app',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: const AuthGate(),
    );
  }
}
