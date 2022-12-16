/**
 * 必要なパッケージのインストールとして下記を実行
 * flutter pub add image_picker_for_web
 * flutter pub add firebase_storage URL:https://pub.dev/packages/firebase_storage/install
 * 
 */

import 'package:flutter/material.dart';
import 'package:share_study_app/data/question_post_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:share_study_app/firestore_api.dart';
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
  List<String> subjectList = [];
  late FirestoreApi firestoreApi = new FirestoreApi();
  var questionData = QuestionPostData(
    qSubId: "", //科目ID
    qId: "", //質問ID
    userId: "", //ユーザーID
    titleContent: "", //タイトルID
    questionContent: "", //質問内容
    email: "",
    // attFiles: "",//画像アップロードする際に使用する
  );
  var classId = "科目を選択してください"; //科目を入れる

  /**画像アップロードする際に使用する */
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
        child: Column(
          children: [
            SizedBox(
              height: 400, //カードの大きさを定義
              child: Card(
                //投稿画面の中身

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //項目の中身
                    Text("タイトル"),
                    TextField(
                      //タイトルを入力
                      maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        helperMaxLines: 10,
                      ),
                      onChanged: (value) {
                        //タイトルを変更
                        questionData =
                            questionData.copyWith(titleContent: value);
                      },
                    ),
                    Text("科目"),
                    SizedBox(height: 10), //間隔を開ける
                    /*科目選択ボタン*/
                    DropdownButton(
                      items: subjectList
                          .map(
                            (String list) => DropdownMenuItem(
                              value: list,
                              child: Text(list),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          //List中にnullがある場合はエラーを返す
                          classId = value ?? "エラー";
                          questionData.copyWith(qSubId: classId);
                        });
                      },
                      value: classId,
                    ),
                    Text("質問内容"),
                    SizedBox(height: 10), //間隔を開ける

                    TextField(
                      //質問内容入力
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      minLines: 4,
                      //controller:  //タイトルをここで取得

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        helperMaxLines: 10,
                      ),
                      onChanged: (value) {
                        questionData =
                            questionData.copyWith(questionContent: value);
                      },
                    ),
                    /**写真アップロードボタン */
                    SizedBox(height: 20), //間隔を開ける
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
            SizedBox(
              height: 50,
            ),
            /**投稿するボタン */
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
              onPressed: () {
                //投稿ボタンを押したときの動作
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('投稿しますか？'),
                        actions: [
                          GestureDetector(
                            child: Text(
                              'いいえ',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          GestureDetector(
                            child: Text(
                              'はい',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              firestoreApi.postQuestion(questionData);
                              print(questionData);
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Text("投稿"),
            ),
          ],
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
