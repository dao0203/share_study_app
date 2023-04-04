import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:share_study_app/data/data_when_register.dart';
import 'package:share_study_app/firestore_api.dart';
import 'package:share_study_app/view/login_and_registration/login_page.dart';
import 'package:share_study_app/view/questions_list/thread_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String tag = "register_page";
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreApi _firestoreApi = FirestoreApi();

  final DataWhenRegister _dataWhenRegister = const DataWhenRegister(
    email: "",
    firstName: "",
    lastName: "",
    password: "",
  );
  final emailTextEditController = TextEditingController();
  final firstNameTextEditController = TextEditingController();
  final lastNameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  final confirmPasswordTextEditController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _errorMessage = "";

  void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final registerText = const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '新規登録',
        style: TextStyle(fontSize: 36.0, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );

    final errorMessage = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _errorMessage,
        style: const TextStyle(fontSize: 14.0, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );

    final email = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return "有効なメールアドレスを入力してください";
          }
          return null;
        },
        controller: emailTextEditController,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocus,
        onFieldSubmitted: (term) {
          FocusScope.of(context).requestFocus(_firstNameFocus);
        },
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

    final firstName = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "名前";
          }
          return null;
        },
        controller: firstNameTextEditController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _firstNameFocus,
        onFieldSubmitted: (term) {
          FocusScope.of(context).requestFocus(_lastNameFocus);
        },
        decoration: InputDecoration(
          hintText: '名前',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

    final lastName = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "姓を入力してください";
          }
          return null;
        },
        controller: lastNameTextEditController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _lastNameFocus,
        onFieldSubmitted: (term) {
          FocusScope.of(context).requestFocus(_passwordFocus);
        },
        decoration: InputDecoration(
          hintText: '姓',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

    final password = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "パスワードを入力してください";
          }
          return null;
        },
        controller: passwordTextEditController,
        obscureText: true,
        textInputAction: TextInputAction.next,
        focusNode: _passwordFocus,
        onFieldSubmitted: (term) {
          FocusScope.of(context).requestFocus(_confirmPasswordFocus);
        },
        decoration: InputDecoration(
          hintText: 'パスワード',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

    final confirmPassword = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "パスワードを入力してください";
          }
          return null;
        },
        controller: confirmPasswordTextEditController,
        obscureText: true,
        textInputAction: TextInputAction.done,
        focusNode: _confirmPasswordFocus,
        onFieldSubmitted: (term) {
          _confirmPasswordFocus.unfocus();
        },
        decoration: InputDecoration(
          hintText: 'パスワードをもう一度入力してください',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
    final registerButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            if (passwordTextEditController.text !=
                confirmPasswordTextEditController.text) {
              setState(() {
                _errorMessage = "パスワードが一致しません";
              });
              return;
            }
            try {
              //registerButtonを押したら画面遷移するまでローディング画面を表示
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });

              //登録するユーザーの情報を作成
              final user = _dataWhenRegister.copyWith(
                  email: emailTextEditController.text,
                  firstName: firstNameTextEditController.text,
                  lastName: lastNameTextEditController.text,
                  password: passwordTextEditController.text,
                  );

              // メールアドレスとパスワードをFirebaseに登録
              await _firebaseAuth
                  .createUserWithEmailAndPassword(
                      email: emailTextEditController.text,
                      password: passwordTextEditController.text)
                  //終了したらFirestoreに登録
                  .then((value) => _firestoreApi
                      .addUser(user)
                      //終了したらスレッドページに遷移
                      .then((value) => Navigator.of(context)
                          .pushReplacementNamed(ThreadPage.tag)));
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                setState(() {
                  _errorMessage = "パスワードが弱すぎます";
                });
              } else if (e.code == 'email-already-in-use') {
                setState(() {
                  _errorMessage = "このメールアドレスは既に使用されています";
                });
              }
            } catch (e) {
              setState(() {
                _errorMessage = e.toString();
              });
            }
          }
        },
        child: const Text('登録'),
      ),
    );

    final loginbutton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: const Text('ログイン'),
      ),
    );
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
            child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
          children: [
            registerText,
            errorMessage,
            email,
            firstName,
            lastName,
            password,
            confirmPassword,
            registerButton,
            loginbutton,
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    emailTextEditController.dispose();
    firstNameTextEditController.dispose();
    lastNameTextEditController.dispose();
    passwordTextEditController.dispose();
    confirmPasswordTextEditController.dispose();
    _emailFocus.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }
}
