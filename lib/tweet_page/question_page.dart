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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ("投稿"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 307,
              height: 272,
              color: Colors.grey[100],
              child: Column(
                //投稿画面の中身
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //項目の中身
                  Text("科目"),
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
                  /**質問内容を投稿するテキスト */
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  /**写真アップロードボタン */
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
