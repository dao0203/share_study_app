//
//   必要なパッケージのインストールとして下記を実行
//   flutter pub add image_picker_for_web
//   flutter pub add firebase_storage URL:https://pub.dev/packages/firebase_storage/install
//

import 'package:flutter/material.dart';
import 'package:share_study_app/data/question_post_data.dart';
import 'package:share_study_app/firestore_api/firestore_api.dart';
import 'package:share_study_app/questions_list/thread_page.dart';
// import 'package:image_picker_web/image_picker_web.dart';

/*投稿画面の初期状態画面

@author 佐藤佑哉
*/
class QuestionPostPage extends StatefulWidget {
  const QuestionPostPage({super.key});

  @override
  State<QuestionPostPage> createState() => _QuestionPostPage();
}

class _QuestionPostPage extends State<QuestionPostPage> {
  FirestoreApi firestoreApi = FirestoreApi();
  late Map<String, String> subjects = {};

  /* フィールド名 */
  late String qSubName = "";
  late String titleContent = "";
  late String questionContent = "";

  final postedQuestionData = const QuestionPostData(
    qSubName: "", //科目ID
    userId: "0", //ユーザーID
    titleContent: "", //タイトルID
    questionContent: "", //質問内容
    googleAccountId: "0",
    // attFiles: "",//画像アップロードする際に使用する
  );
  final _formKey = GlobalKey<FormState>();

// ドロップダウンアイテムに使うデータを非同期処理で代入するメソッド
  Future<void> loadDropDownItems() async {
    final items = await firestoreApi.getDocumentIdAndSubject();
    setState(() {
      subjects = items;
    });
  }

  @override
  void initState() {
    super.initState();
    Future<void>(() async {
      await loadDropDownItems();
    });
  }

  // 画像アップロードする際に使用する
  // var _isfiled = false; //写真をアップしているかしていないか
  // XFile? _pickedFile;
  // void _setImageFileListFromFile(XFile? value) {
  //   _pickedFile = value;
  //   value == null ? _isfiled = false : _isfiled = true;
  // }
  // final storage = FirebaseStorage.instance;
  // final storageRef = FirebaseStorage.instance.ref();
  // late File _image;
  // final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
                      //間隔を開ける
                      /*科目選択ボタン*/
                      // DropdownButton(
                      //   value: classId,
                      //   hint: const Text("科目を選択して下さい"),
                      //   items: subjects.entries
                      //       .map(
                      //         (entry) => DropdownMenuItem(
                      //           value: entry.key,
                      //           child: Text(entry.value),
                      //         ),
                      //       )
                      //       .toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       //List中にnullがある場合はエラーを返す
                      //       classId = value ?? "エラー";
                      //       questionData.copyWith(qSubId: classId);
                      //     });
                      //   },
                      // ),
                      FutureBuilder<Map<String, String>>(
                        future: firestoreApi.getDocumentIdAndSubject(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // データをまだ取得できていない場合、ローディングスピンナーを表示する
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // データ取得時にエラーが発生した場合、エラーメッセージを表示する
                            return Text("Error: ${snapshot.error}");
                          } else {
                            // 取得したマップを使用して、DropdownButtonを構築
                            return DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "科目を選択してください";
                                }
                                return null;
                              },
                              items: snapshot.data?.entries.map((entry) {
                                return DropdownMenuItem<String>(
                                  value: entry.value,
                                  child: Text(entry.value),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                labelText: "科目",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
                              //選択された科目名を追加
                              onChanged: (value) {
                                qSubName = value.toString();
                              },
                            );
                          }
                        },
                      ),
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
                          titleContent = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        //質問内容入力
                        maxLength: 100,
                        maxLines: 1,
                        minLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "質問を入力してください";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
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
                          questionContent = value;
                        },
                      ),
                      /**写真アップロードボタン */
                      const SizedBox(height: 20), //間隔を開ける
                      // _isfiled
                      //     ? Column(
                      //         //写真あり
                      //         children: [
                      //           SizedBox(
                      //             height: 90,
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.center,
                      //               children: [
                      //                 ClipRRect(
                      //                   borderRadius:
                      //                       BorderRadius.circular(3.0),
                      //                   child: kIsWeb //Webで実行されているかどうかを判断する

                      //                       ? Image.network(
                      //                           _pickedFile!.path)
                      //                       : Image.file(
                      //                           File(_pickedFile!.path),
                      //                           errorBuilder: (c, o, s) {
                      //                             return const Icon(
                      //                               Icons.error,
                      //                               color: Colors.red,
                      //                             );
                      //                           },
                      //                           fit: BoxFit.cover,
                      //                         ), //htmlとioのインポートの種類に注意
                      //                 ),
                      //                 SizedBox(width: 50),
                      //                 ElevatedButton(
                      //                   child: Text('写真を削除'),
                      //                   onPressed: () {
                      //                     _pickedFile = null;
                      //                     setState(() {
                      //                       _setImageFileListFromFile(
                      //                           _pickedFile);
                      //                     });
                      //                   },
                      //                 )
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       )
                      //     : Column(
                      //         //写真なし
                      //         children: [
                      //           Text("写真をアップロード"),
                      //           SizedBox(height: 5),
                      //           SizedBox(
                      //             width: 180,
                      //             height: 50,
                      //             child: ElevatedButton(
                      //               child: Text("＋写真をアップロード"),
                      //               onPressed: () {
                      //                 setState(() {
                      //                   _onImageButtonPressed();
                      //                   _setImageFileListFromFile(
                      //                       _pickedFile);
                      //                 });
                      //               },

                      //               // onPressed: () async {
                      //               //   // var picture = await select_picture(
                      //               //   //     context); //写真機能とギャラリー機能
                      //               //   // setState(() {
                      //               //   //   _setImageFileListFromFile(picture);
                      //               //   // });
                      //               // },
                      //             ),
                      //           ),
                      //         ],
                      //       ),
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
                  if (_formKey.currentState!.validate()) {
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
                              onTap: () {
                                final questionDatacopy =
                                    postedQuestionData.copyWith(
                                  googleAccountId: "1",
                                  userId: "1",
                                  qSubName: qSubName,
                                  titleContent: titleContent,
                                  questionContent: questionContent,
                                );
                                firestoreApi.postQuestion(questionDatacopy);
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
      ),
    );
  }
/*画像をアップロードする際に使用する */
  // Future<void> _onImageButtonPressed() async {
  //   final XFile? pickedfile =
  //       await _picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _pickedFile = XFile(pickedfile!.path);
  //   });
  // }
}
