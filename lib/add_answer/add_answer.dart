import 'package:flutter/material.dart';

class AddAnswerPage extends StatefulWidget {
  const AddAnswerPage({super.key, required this.title});
  final String title;
  @override
  State<AddAnswerPage> createState() => _AddAnswerPage();
}

class QuestionArguments {
  final String qId;
  final String qUserId;
  final String qTitle;
  final String qSubject;
  final String question;
  final String attFiles;
  const QuestionArguments(
      {required this.qId,
      required this.qUserId,
      required this.qTitle,
      required this.qSubject,
      required this.question,
      required this.attFiles});
}

class AnswerArguments {
  final String qId; //質問のID
  final String aId; //回答のID
  final String aUserId; //回答したユーザーのID
  final String answer; //回答の内容
  final String numAnswers; //回答の数
  final String attFiles; //添付ファイル

  const AnswerArguments(
      {required this.qId,
      required this.aId,
      required this.aUserId,
      required this.answer,
      required this.numAnswers,
      required this.attFiles});
}

class _AddAnswerPage extends State<AddAnswerPage> {
  @override
  Widget build(BuildContext context) {
    QuestionArguments q = const QuestionArguments(
        qId: "0",
        qUserId: "0",
        qTitle: "title",
        qSubject: "subject",
        question: "sample",
        attFiles: "sample");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ("質問回答"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            //質問表示部分
            SizedBox(
              //カードの大きさを定義
              height: 200,
              width: double.infinity,

              child: Card(
                //投稿画面の中身
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //項目の中身
                    Text("質問：${q.qTitle}"),
                    const SizedBox(height: 10),
                    Text("科目:${q.qSubject}"),
                    const SizedBox(height: 10), //間隔を開ける
                    /*科目選択ボタン*/
                    Text("質問内容:${q.question}"),
                    const SizedBox(height: 20), //間隔を開ける
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //回答入力部分
            SizedBox(
              //カードの大きさを定義
              height: 300,

              child: Card(
                //投稿画面の中身
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //項目の中身
                    const Text("回答"),

                    //間隔を開ける
                    const SizedBox(height: 10),

                    TextField(
                      // 回答入力
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      minLines: 4,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        helperMaxLines: 10,
                      ),
                    ),

                    const SizedBox(height: 20), //間隔を開ける
                  ],
                ),
              ),
            ),

            /**投稿するボタン */
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                //投稿ボタンを押したときの動作
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('投稿しますか？'),
                        actions: [
                          GestureDetector(
                            child: const Text('いいえ'),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          GestureDetector(
                            child: const Text('はい'),
                            onTap: () {},
                          ),
                        ],
                      );
                    });
              },
              child: const Text("投稿"),
            ),
          ],
        ),
      ),
    );
  }
}
