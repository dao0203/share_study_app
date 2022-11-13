import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:share_study_app/data/question_data.dart';
import 'package:share_study_app/tweet_page/loading_progress_indicator.dart';
import 'package:share_study_app/tweet_page/picture_upload.dart';
import 'picture_uploaded.dart';

/*投稿画面の初期状態画面

@author 佐藤佑哉
*/
class QuestionPostPage extends StatefulWidget {
  const QuestionPostPage({super.key});

  @override
  State<QuestionPostPage> createState() => _QuestionPostPage();
}

class _QuestionPostPage extends State<QuestionPostPage> {
  var questionData = QuestionData(
    dropDownLists: [],
    id: "1",
    userId: "2",
    titleContent: "",
    questionContent: "",
    attFiles: "",
  );
  var classId = "科目を選択してください"; //科目を入れる
  var loading = false; //ロード中の画面遷移の仕方
  var fileHave = false; //写真をアップしているかしていないか
  @override
  Widget build(BuildContext context) {
    return loading
        ? loadingProgressIndicator()
        : Scaffold(
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
                          ),
                          Text("科目"),
                          SizedBox(height: 10), //間隔を開ける
                          /*科目選択ボタン*/
                          DropdownButton(
                            items: questionData.dropDownLists
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
                          ),
                          /**写真アップロードボタン */
                          SizedBox(height: 20), //間隔を開ける
                          fileHave
                              ? PictureUploaded() //今は任意のwidgetだが、作成中のwidgetに変更する予定
                              : Column(
                                  children: [
                                    Text("写真をアップロード"),
                                    SizedBox(height: 5),
                                    SizedBox(
                                      width: 180,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          select_icon(context);
                                        }, //写真機能とギャラリー機能
                                        child: Text("＋写真をアップロード"),
                                      ),
                                    ),
                                  ],
                                ),
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
                                    Navigator.pop(context);
                                    setState(() {
                                      loading = !loading;
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
    ;
  }
}
