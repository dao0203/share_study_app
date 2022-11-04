import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: '711995609799-lburp88a2ti6rv5g5tgajb6vdub1s6t5.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class TitlePage extends StatelessWidget {
  GoogleSignInAccount? account;

  TitlePage({super.key}) {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      if (account != null) {
        final http.Response response = await http.get(
          // Uri.parse('https://people.googleapis.com/v1/people/me/connection?requestMask.includeField=person.names'),
          Uri.parse("https://people.googleapis.com/v1/people/me?personFields=names,genders,emailAddresses,phoneNumbers"),
          headers: await account.authHeaders,
        );
        this.account = account;

        if (response.statusCode != 200) {
          print("Response error!!");
          print(response.body);
        }
      }
    });

    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("Sign in error");
      print(error);
    }
  }

  // Firestoreのユーザ情報にgoogle account IDをいれる
  // ログイン時に照会して、既存なら読み込む
  // 存在しなければ新しくデータを追加
  Future<void> _referFirestore() async {
    if (account != null) {
      final snapshot = await FirebaseFirestore.instance.collection('users').get();
      bool isExist = false;

      for (final doc in snapshot.docs) {
        try {
          if (doc['googleAccountId'] == account!.id) {
            isExist = true;
            break;
          }
        } catch (error) {
          print(error);
        }
      }

      if (!isExist) {
        Map<String, dynamic> data = {
          'name': account!.displayName,
          'googleAccountId': account!.id
        };
        await FirebaseFirestore.instance.collection('users').add(data);
      }

      print("name: ${account!.displayName}, id: ${account!.id}");
    }
  }

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
                    _handleSignIn();
                    _referFirestore();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const NextPage()
                    ));
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('login'),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share study')
      ),
      body: Center(
        child: Text(
          "Next Page.",
          style: Theme.of(context).textTheme.headline2,
        ),
      )
    );
  }
}