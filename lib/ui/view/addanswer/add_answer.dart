import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/firebase/firestore_api.dart';
import 'package:share_study_app/ui/view/timeline/components/question_items.dart';
import 'package:share_study_app/ui/view/timeline/thread_page.dart';

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
  final _isPostedAnswerData = Answer();

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
                                  content: _answerTextController.text,
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
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  ThreadPage.tag,
                                  (_) => false,
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
