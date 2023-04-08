import 'package:flutter/material.dart';

//ベストアンサーされている質問の回答ページ
class AnswerPageBA extends StatefulWidget {
  const AnswerPageBA({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AnswerPageBA> createState() => _AnswerPageBA();
}

class _AnswerPageBA extends State<AnswerPageBA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
