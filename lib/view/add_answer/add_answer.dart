import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_study_app/data/answer_post_data.dart';
import 'package:share_study_app/firestore_api.dart';
import 'package:share_study_app/view/questions_list/item/question_items.dart';
import 'package:share_study_app/view/questions_list/thread_page.dart';
import '../../constants.dart';

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
  late DocumentSnapshot<Object?> documentSnapshot;
  late String questionId = "";
  final _isPostedAnswerData = const AnswerPostData(
    email: "",
    answerText: "",
    questionId: "",
    lastName: "",
    firstName: "",
    grade: "",
  );

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _answerTextController = TextEditingController();

  Future<void> getUser() async {
    final user = await firestoreApi.getUser();
    setState(() {
      documentSnapshot = user;
    });
  }

  @override
  void initState() {
    super.initState();
    questionId = widget.questionId;
    Future<void>(
      () async {
        await getUser();
      },
    );
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
            //質問表示部分
            FutureBuilder(
              future: firestoreApi.getSelectedQuestion(questionId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error：${snapshot.error}");
                  } else {
                    final questionItem =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return questionItemsOfAnswerListPage(context, questionItem);
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),

            //回答入力部分
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //間隔を開ける

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "回答を記入してください";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      maxLines: 4,
                      maxLength: 200,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          helperMaxLines: 10,
                          labelText: "回答"),
                      controller: _answerTextController,
                    ),
                  ),
                ],
              ),
            ),

            /**投稿するボタン */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  //投稿ボタンを押したときの動作
                  if (_formKey.currentState!.validate()) {
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
                                //ローディングインディケータを表示する
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                                final isPostedAnswerData =
                                    _isPostedAnswerData.copyWith(
                                  answerText: _answerTextController.text,
                                  lastName: (documentSnapshot.data()
                                      as Map<String, dynamic>)[USERS_LAST_NAME],
                                  firstName: (documentSnapshot.data() as Map<
                                      String, dynamic>)[USERS_FIRST_NAME],
                                  grade: (documentSnapshot.data()
                                      as Map<String, dynamic>)[USERS_GRADE],
                                );
                                firestoreApi
                                    .postAnswer(isPostedAnswerData, questionId)
                                    .then((value) =>
                                        //スナックバー以外に表示する方法がわからない
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text("投稿しました"),
                                          ),
                                        ));
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
                      },
                    );
                  }
                },
                child: const Text("投稿"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
