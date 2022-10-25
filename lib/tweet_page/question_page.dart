import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

/*投稿画面の初期状態画面

@author 佐藤佑哉
*/
class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

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
              height: 400,
              child: Card(
                //投稿画面の中身

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //項目の中身
                    Text("科目"),
                    SizedBox(height: 10),
                    /*科目選択ボタン*/
                    DropdownButton(items: const [
                      DropdownMenuItem(
                        child: Text("科目を選択して下さい"),
                        value: '科目を選択して下さい',
                      ),
                      DropdownMenuItem(
                        child: Text("科目1"),
                        value: '科目1',
                      ),
                      DropdownMenuItem(
                        child: Text("科目2"),
                        value: '科目2',
                      ),
                    ], onChanged: (String? value) {}),
                    Text("質問内容"),
                    SizedBox(height: 10),
                    /**質問内容を投稿するテキスト */
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: '質問を入力（230文字以内）',
                          icon: Icon(Icons.question_mark)),
                    ),
                    /**写真アップロードボタン */
                    SizedBox(height: 20), //間隔を開ける
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("＋写真をアップロード"),
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment(
                          0,
                          0,
                        ),
                      ),
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
              onPressed: () {},
              child: Text("投稿"),
            ),
          ],
        ),
      ),
    );
  }
}
