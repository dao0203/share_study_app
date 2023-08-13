import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_study_app/view/login_and_registration/privacy_policy_web.dart';
import 'package:share_study_app/view/login_and_registration/register_page.dart';
import 'package:share_study_app/view/questions_list/thread_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = "login_page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Formウィジェットを一意に識別するためにグローバルキーを作成
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _errorMessage = "";

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void onChange() {
    setState(() {
      _errorMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    emailController.addListener(onChange);
    passwordController.addListener(onChange);

    const loginMessage = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'ログイン',
        style: TextStyle(fontSize: 36.0),
        textAlign: TextAlign.center,
      ),
    );

    //エラーメッセージテキスト
    final errorMessage = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _errorMessage,
        style: const TextStyle(fontSize: 14.0, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );

    //emailを入力する手テキストフィールドウィジェット
    final email = TextFormField(
      validator: (value) {
        if (!RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
            .hasMatch(value!)) {
          return '有効なメールアドレスを入力してください';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress, //キーボードタイプを選択
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.next, //次のテキストフィールドにカーソルを移す
      onEditingComplete: () => node.nextFocus(), //次のテキストフィールドにカーソルを移す
    );

    //パスワードを入力するテキストフィールドウィジェット
    final password = TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "パスワードを入力してください";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.done,
      onEditingComplete: () => node.unfocus(),
      obscureText: true, //パスワードを隠す
      controller: passwordController,
    );

    //ログインボタン
    final loginButton = ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          //ボタンが押されたらローディング中を表すダイアログを表示
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              barrierDismissible: false);

          await signIn(emailController.text, passwordController.text)
              .then((value) => {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      ThreadPage.tag,
                      (_) => false,
                    ),
                  })
              .catchError((e) => {
                    processError(e),
                    Navigator.of(context).pop(),
                  });
        }
      },
      child: const Text("ログイン"),
    );

    final registerButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RegisterPage.tag);
      },
      child: const Text("新規登録"),
    );

    final privacypolicyButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(PrivacyPolicyWebPage.tag);
      },
      child: const Text('プライバシーポリシー'),
    );

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                loginMessage,
                const SizedBox(height: 24.0),
                errorMessage,
                const SizedBox(height: 12.0),
                email,
                const SizedBox(height: 8.0),
                password,
                const SizedBox(height: 24.0),
                loginButton,
                const SizedBox(height: 8.0),
                registerButton,
                const SizedBox(height: 8.0),
                privacypolicyButton,
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //テキストエディティングコントローラを破棄
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn(final String email, final String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  void processError(final error) {
    if (error.code == "user-not-found") {
      setState(() {
        _errorMessage = "ユーザを見つけることができませんでした";
      });
    } else if (error.code == "wrong-password") {
      setState(() {
        _errorMessage = "パスワードが正しくありません";
      });
    } else if (error.code == "invalid-email") {
      setState(() {
        _errorMessage = "メールアドレスが正しくありません";
      });
    } else {
      setState(() {
        _errorMessage = "ログイン時にエラーが起きました。後ほどお試しください";
      });
    }
  }
}
