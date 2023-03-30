import 'package:flutter/material.dart';
import 'package:share_study_app/data/answer_post_data.dart';
import 'package:share_study_app/firestore_api/firestore_api.dart';
import 'package:share_study_app/questions_list/thread_page.dart';

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

class PostAnswerPage extends StatefulWidget {
  const PostAnswerPage({super.key, required this.questionId});

  final String questionId;

  @override
  State<PostAnswerPage> createState() => _PostAnswerPage();
}

class _PostAnswerPage extends State<PostAnswerPage> {
  FirestoreApi firestoreApi = FirestoreApi();
  late String questionId = "";
  late String answerText = "";
  late String googleAccountId = "";
  final _isPostedAnswerData = const AnswerPostData(
    answerText: "",
    googleAccountId: "",
  );

  @override
  void initState() {
    super.initState();
    questionId = widget.questionId;
  }

  @override
  Widget build(BuildContext context) {
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
            FutureBuilder(
              future: firestoreApi.getSelectedQuestion(questionId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error：${snapshot.error}");
                  } else {
                    final questionItems =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return SizedBox(
                      //カードの大きさを定義
                      height: 200,
                      width: double.infinity,
                      child: Card(
                        //投稿画面の中身
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //項目の中身
                            Text(
                              "${questionItems["title"]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${questionItems["subjectName"]}",
                              style: const TextStyle(fontSize: 19.0),
                            ),
                            const SizedBox(height: 10), //間隔を開ける
                            Text(
                              "${questionItems["textContent"]}",
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 20), //間隔を開ける
                          ],
                        ),
                      ),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),

            const SizedBox(height: 20),

            //回答入力部分
            SizedBox(
              //カードの大きさを定義
              height: 300,

              child: Form(
                child: Card(
                  //投稿画面の中身
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //間隔を開ける
                      const SizedBox(height: 10),

                      TextFormField(
                        // 回答入力
                        maxLines: 4,
                        maxLength: 400,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 1),
                            ),
                            helperMaxLines: 10,
                            labelText: "回答"),
                        onChanged: (value) => answerText = value,
                      ),

                      const SizedBox(height: 20), //間隔を開ける
                    ],
                  ),
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
                            onTap: () {
                              final isPostedAnswerPageCopy = _isPostedAnswerData
                                  .copyWith(answerText: answerText);
                              firestoreApi.postAnswer(
                                  isPostedAnswerPageCopy, questionId);
                              // Navigator.popUntil(
                              //   context,
                              //   ((route) => route.settings.name == "/home"),
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ThreadPage(),
                                ),
                              );
                            },
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
