import 'package:flutter/material.dart';
import 'package:share_study_app/top_page/login_page.dart';
import 'package:share_study_app/top_page/sign_up_page.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

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
                'Welcome to Share Study!!',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LoginPage()
                    ));
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('login'),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SignUpPage()
                    ));
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('sign up'),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
