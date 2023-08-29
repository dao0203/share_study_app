import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/ui/theme/colors.dart';
import 'package:share_study_app/ui/view/onboarding/login/login_page.dart';
import 'package:share_study_app/ui/view/privacy_policy/privacy_policy_web.dart';
import 'package:share_study_app/ui/view/onboarding/registration/register_page.dart';
import 'package:share_study_app/ui/view/timeline/thread_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).catchError((error) {
    log("errorを検出：$error");
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "questions_screen": (context) => const QuestionsScreen(),
          LoginPage.tag: (context) => const LoginPage(),
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
        home: StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                return const QuestionsScreen();
              } else {
                return const LoginPage();
              }
            }
          },
        ),
      ),
    );
  }
}
