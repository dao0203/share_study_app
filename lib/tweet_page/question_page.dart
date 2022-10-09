import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        child: Container(
          width: 307,
          height: 272,
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("科目"),
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
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
