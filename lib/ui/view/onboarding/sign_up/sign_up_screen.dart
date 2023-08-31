import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/onboarding/registration_profile/registration_profile_screen.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRepository = ref.watch(userAuthRepositoryProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmController = useTextEditingController();
    final passwordVisible = useState(false);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "サインアップ",
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      Icon(
                        Icons.person_add_outlined,
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
                              color:
                                  Theme.of(context).colorScheme.onBackground),
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
                          labelText: 'パスワード',
                          //テキストのラベルの色を変更
                          labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'パスワードを入力してください';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                          controller: passwordConfirmController,
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
                            labelText: 'パスワード(確認)',
                            //テキストのラベルの色を変更
                            labelStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'パスワードを入力してください';
                            } else if (passwordController.text !=
                                passwordConfirmController.text) {
                              return 'パスワードが一致しません';
                            }
                            return null;
                          }),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => const Center(
                                    child: CircularProgressIndicator()));
                            await userRepository
                                .signUp(emailController.text,
                                    passwordConfirmController.text)
                                .then((value) {
                              Logger().d("signup success");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationProfileScreen(),
                                ),
                              );
                            }).catchError((e) {
                              Logger().e(e);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            });
                          }
                        },
                        icon: const Icon(Icons.person_add),
                        label: const Text("サインアップ"),
                      ),
                      const SizedBox(height: 20),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('サインインはこちら'),
                      ),
                      const SizedBox(height: 20),
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(height: 1.8),
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
        ));
  }
}
