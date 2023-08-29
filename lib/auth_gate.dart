import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/ui/view/onboarding/login/login_page.dart';
import 'package:share_study_app/ui/view/timeline/thread_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends HookConsumerWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Supabase.instance.client.auth.currentSession != null
        ? const QuestionsScreen()
        : const LoginPage();
  }
}
