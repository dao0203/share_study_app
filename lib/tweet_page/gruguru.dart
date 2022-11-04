import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_study_app/tweet_page/question_post_page.dart';

class Guruguru extends StatefulWidget {
  const Guruguru({super.key});

  @override
  State<Guruguru> createState() => _Guruguru();
}

/*非同期処理するときの待ち時間 */
class _Guruguru extends State<Guruguru> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            appBar: AppBar(
              title: const Text("ロード中"),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Center(
                child: CircularProgressIndicator(), //真ん中に表示
              ),
            ),
          )
        : QuestionPostPage(); //質問閲覧の所に戻る予定
  }
}
