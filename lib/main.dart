import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_study_app/ui/theme/colors.dart';
import 'package:share_study_app/view/login_and_registration/login_page.dart';
import 'package:share_study_app/view/login_and_registration/privacy_policy_web.dart';
import 'package:share_study_app/view/login_and_registration/register_page.dart';
import 'package:share_study_app/view/questions_list/thread_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ThreadPage.tag: (context) => const ThreadPage(),
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
              return const ThreadPage();
            } else {
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}
