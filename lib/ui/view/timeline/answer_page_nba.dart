import 'package:flutter/material.dart';

//ベストアンサーされていない質問の回答ページ
class AnswerPageNBA extends StatefulWidget {
  const AnswerPageNBA({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AnswerPageNBA> createState() => _AnswerPageNBA();
}

class _AnswerPageNBA extends State<AnswerPageNBA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
