import 'package:flutter/material.dart';
import 'package:share_study_app/top_page/commons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Study'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Log in',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 300,
                child: inputField('mail address', false),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 300,
                child: inputField('password', true),
              )
            ),
          ],
        ),
      )
    );
  }
}
