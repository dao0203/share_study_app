import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/auth_gate.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/onboarding/sign_up/sign_up_screen.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAuthRepository = ref.watch(userAuthRepositoryProvider);
    final formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordVisible = useState(false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'サインイン',
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
                        prefixIcon: const Icon(Icons.mail),
                        labelText: 'メールアドレス',
                        //テキストのラベルの色を変更
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'メールアドレスを入力してください';
                        } else if (!value.contains('@')) {
                          return 'メールアドレスの形式が正しくありません';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisible.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            passwordVisible.value = !passwordVisible.value;
                          },
                        ),
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground),
                        labelText: 'パスワード',
                      ),
                      maxLength: 20,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'パスワードを入力してください';
                        } else if (value.length < 6) {
                          return 'パスワードは6文字以上で入力してください';
                        } else if (value.length > 20) {
                          return 'パスワードは20文字以下で入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          await userAuthRepository
                              .signIn(
                            emailController.text,
                            passwordController.text,
                          )
                              .then((value) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const AuthGate(),
                              ),
                              (_) => false,
                            );
                          });
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('サインイン'),
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.person_add),
                      label: const Text('アカウントをお持ちでない方はこちら'),
                    ),
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(height: 1.8, letterSpacing: 2),
                        children: [
                          TextSpan(text: 'このサービスのご利用を開始することで、'),
                          TextSpan(text: 'プライバシーポリシー'),
                          TextSpan(text: 'および'),
                          TextSpan(text: '利用規約'),
                          TextSpan(text: 'に同意するものとします。'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
