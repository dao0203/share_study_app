import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:share_study_app/top_page/next_page.dart';

// ページのWidget
class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

// ページのState
class _TitlePageState extends State<TitlePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: dotenv.get('CLIENT_ID'),
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? account; // GoogleAccount
  bool? successSignIn; // サインインが成功したかどうか

  _TitlePageState() {
    // アカウントがログイン/変更された時の処理
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (account != null) {
        setState(() {
          this.account = account;
          successSignIn = true;
        });

        // FirestoreのテーブルからdocumentIDを取得
        // 取得できたらページ遷移
        getDocId().then((docId) => {
              if (docId != null)
                {
                  goToNextPage(docId),
                }
              else
                {
                  print("document ID is null."),
                }
            });
      }
    });

    // キャッシュなどで既にログインしてた場合の処理（たぶん）
    _googleSignIn.signInSilently().then((account) {
      this.account = account;
    });
  }

  // サインイン
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      setState(() {
        successSignIn = false;
      });
      print("Sign in error!!");
      print(error);
    }
  }

  // ページ遷移
  // 次のページにdocumentIDだけ渡す。
  // tableから値引っ張る処理は遷移後のページでやる。（いまのところ）
  void goToNextPage(String docId) {
    // 遷移後のページに渡す値を設定
    RouteSettings settings = RouteSettings(arguments: docId);

    // ページ遷移
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NextPage(),
      settings: settings,
    ));
  }

  // Firestoreから、googleAccountIDを使ってDocumentIDを取得
  Future<String?> getDocId() async {
    if (account != null) {
      final table = FirebaseFirestore.instance.collection('users');
      final snapshot =
          await table.where('googleAccountId', isEqualTo: account!.id).get();

      if (snapshot.size == 1) {
        // whereで正しく検索できた場合
        return snapshot.docs.first.id;
      } else {
        // まだ存在していない場合、テーブルに追加 => 生成されたdocIDを返す
        final docId = await register(table);
        return docId;
      }
    } else {
      return null;
    }
  }

  // テーブルへのデータ追加
  Future<String> register(
      CollectionReference<Map<String, dynamic>> table) async {
    Map<String, dynamic> data = {
      'name': account!.displayName,
      'googleAccountId': account!.id,
    };
    final docRef = await table.add(data);
    return docRef.id;
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
                    onPressed: () async {
                      await _handleSignIn();
                    },
                    icon: const Icon(Icons.login),
                    label: const Text('login'),
                  ),
                )),

            // サインインに失敗した場合、エラーテキストを画面に表示
            if (successSignIn != null)
              if ((successSignIn!) == false)
                const Text(
                  "Sign in Failure!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 70,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
