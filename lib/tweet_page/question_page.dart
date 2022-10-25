import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

/*投稿画面の初期状態画面

@author 佐藤佑哉
*/
class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var selectedValue = "科目を選択してください";
  final dropDownLists = <String>["科目を選択してください", "科目１", "科目２"];
  late File _image; //カメラから画像を取得
  final picker = ImagePicker(); //カメラから画像を取得するメソッドを宣言

  Future getImageFromCamera() async {
    final PickedFile = await picker.getImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    String qusetion;
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

                    Text("科目"),
                    SizedBox(height: 10), //間隔を開ける
                    /*科目選択ボタン*/
                    DropdownButton(
                      items: dropDownLists
                          .map(
                            (String list) => DropdownMenuItem(
                              value: list,
                              child: Text(list),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                      value: selectedValue,
                    ),
                    Text("質問内容"),
                    SizedBox(height: 10), //間隔を開ける

                    TextField(
                      //質問内容入力
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: '質問を入力（230文字以内）',
                      ),
                    ),
                    /**写真アップロードボタン */
                    SizedBox(height: 20), //間隔を開ける
                    Text("写真をアップロード"),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add_a_photo),
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.photo_library),
                        )
                      ],
                    )
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
              onPressed: () {},
              child: Text("投稿"),
            ),
          ],
        ),
      ),
    );
  }
}
