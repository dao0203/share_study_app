import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_study_app/data/answer_post_data.dart';
import 'package:share_study_app/firestore_api.dart';
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
                    final questionItems =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: questionItems[QUESTIONS_LAST_NAME] +
                            questionItems[QUESTIONS_FIRST_NAME],
                        labelStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      child: SizedBox(
                        height: 400,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //科目名
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    questionItems[QUESTIONS_SUBJECT_NAME],
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),

                              //タイトル
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: "タイトル",
                                    border: InputBorder.none,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    width: double.infinity,
                                    height: 32.0 * 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${questionItems[QUESTIONS_TITLE]}",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //質問内容
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                      labelText: "質問内容",
                                      border: InputBorder.none,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${questionItems[QUESTIONS_QUESTION_CONTENT]}",
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                key: _formKey,
                child: Card(
                  //投稿画面の中身
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //間隔を開ける
                      const SizedBox(height: 10),

                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "回答を記入してください";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
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
                        controller: _answerTextController,
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
                              final isPostedAnswerData =
                                  _isPostedAnswerData.copyWith(
                                answerText: _answerTextController.text,
                                lastName: (documentSnapshot.data()
                                    as Map<String, dynamic>)[USERS_LAST_NAME],
                                firstName: (documentSnapshot.data()
                                    as Map<String, dynamic>)[USERS_FIRST_NAME],
                              );
                              firestoreApi.postAnswer(
                                  isPostedAnswerData, questionId);
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
          ],
        ),
      ),
    );
  }
}
