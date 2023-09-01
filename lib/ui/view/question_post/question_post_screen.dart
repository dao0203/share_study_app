import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/domain/subject.dart';
import 'package:share_study_app/data/firebase/firestore_api.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/subject_state.dart';

import '../timeline/timeline_screen2.dart';

class QuestionPostScreen extends HookConsumerWidget {
  FirestoreApi firestoreApi = FirestoreApi();

  //フォーム識別のグローバルキーを宣言
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionRepository = ref.watch(questionRepositoryProvider);
    final subjectState = ref.watch(subjectStateProvider);
    final questionState = useState(Question());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ("投稿"),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 400, //カードの大きさを定義
                child: Card(
                  //投稿画面の中身

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10), //間隔を開ける
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "タイトルを入力してください";
                          }
                          return null;
                        },
                        maxLines: 1,
                        minLines: 1,
                        maxLength: 30,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                          ),
                          labelText: "タイトル",
                          helperMaxLines: 10,
                        ),
                        onChanged: (value) {
                          //タイトルを変更
                          questionState.value = questionState.value.copyWith(
                            title: value,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        //質問内容入力
                        maxLength: 400,
                        maxLines: 6,
                        minLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "質問を入力してください";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                          ),
                          labelText: "質問内容",
                          helperMaxLines: 10,
                        ),
                        onChanged: (value) {
                          //質問内容を変更
                          questionState.value = questionState.value.copyWith(
                            content: value,
                          );
                        },
                      ),
                      subjectState.when(
                        data: (data) {
                          return DropdownButtonFormField<String>(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "科目を選択してください";
                              }
                              return null;
                            },
                            items: data.map((subject) {
                              return DropdownMenuItem<String>(
                                value: subject.name,
                                child: Text(subject.name),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              labelText: "科目",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            //選択された科目名を追加
                            onChanged: (value) {
                              questionState.value =
                                  questionState.value.copyWith(
                                subject: Subject(
                                  name: value!,
                                ),
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return Text("Error: $error");
                        },
                        loading: () {
                          return const CircularProgressIndicator();
                        },
                      ),
                      // FutureBuilder<Map<String, String>>(
                      //   future: firestoreApi.getDocumentIdAndSubject(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.waiting) {
                      //       // データをまだ取得できていない場合、ローディングスピンナーを表示する
                      //       return const CircularProgressIndicator();
                      //     } else if (snapshot.hasError) {
                      //       // データ取得時にエラーが発生した場合、エラーメッセージを表示する
                      //       return Text("Error: ${snapshot.error}");
                      //     } else {
                      //       // 取得したマップを使用して、DropdownButtonを構築
                      //       return DropdownButtonFormField<String>(
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return "科目を選択してください";
                      //           }
                      //           return null;
                      //         },
                      //         items: snapshot.data?.entries.map((entry) {
                      //           return DropdownMenuItem<String>(
                      //             value: entry.value,
                      //             child: Text(entry.value),
                      //           );
                      //         }).toList(),
                      //         decoration: InputDecoration(
                      //           filled: true,
                      //           fillColor:
                      //               Theme.of(context).scaffoldBackgroundColor,
                      //           labelText: "科目",
                      //           enabledBorder: const OutlineInputBorder(
                      //             borderSide: BorderSide(width: 1),
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(10),
                      //             ),
                      //           ),
                      //         ),
                      //         //選択された科目名を追加
                      //         onChanged: (value) {
                      //           questionState.value =
                      //               questionState.value.copyWith(
                      //                   subject: Subject(
                      //             name: value!,
                      //           ));
                      //         },
                      //       );
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              /**投稿するボタン */
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //投稿ボタンを押したときの動作
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('投稿しますか？'),
                        actions: [
                          GestureDetector(
                            child: const Text(
                              'キャンセル',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          GestureDetector(
                            child: const Text(
                              '投稿',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () async {
                              //投稿ボタンを押した時にインディケータを表示
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                barrierDismissible: false,
                              );
                              await questionRepository
                                  .addQuestion(
                                    questionState.value,
                                  )
                                  .then((value) => print("投稿完了"));
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const TimelineScreen(),
                                  maintainState: false,
                                ),
                                (_) => false,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // }
                },
                child: const Text("投稿"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
