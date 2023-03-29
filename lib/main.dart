import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_study_app/google_sign_in_demo.dart';
import 'package:share_study_app/questions_list/thread_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).catchError((error) {
    log("errorを検出：$error");
  });

  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      routes: {
        "/home": (context) => const ThreadPage(),
      },
      title: 'Share_study_app',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SignInDemo(),
    );
  }
}
