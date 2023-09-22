import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/auth_gate.dart';
import 'package:share_study_app/ui/theme/colors.dart';

class ThemeSettings extends HookConsumerWidget {
  const ThemeSettings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Edge to edgeの設定
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
