import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "ログイン",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Icon(
                    Icons.login,
                    size: 50,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      labelText: 'メールアドレス',
                      //テキストのラベルの色を変更
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'メールアドレスを入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'パスワード',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'パスワードを入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.login),
                    label: const Text('サインイン'),
                  ),
                  const SizedBox(height: 20),
                  //サインアップ画面へ遷移
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    icon: const Icon(Icons.person_add),
                    label: const Text('アカウントをお持ちでない方はこちら'),
                  ),
                  const Text.rich(
                    TextSpan(
                      style: TextStyle(height: 1.8, letterSpacing: 2),
                      children: [
                        TextSpan(text: "このサービスのご利用を開始することで、"),
                        TextSpan(text: "プライバシーポリシー"),
                        TextSpan(text: "および"),
                        TextSpan(text: "利用規約"),
                        TextSpan(text: "に同意するものとします。"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
