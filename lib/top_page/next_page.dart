import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 遷移前のページから渡された値を取得
    Object? docId;
    if (ModalRoute.of(context) != null) {
      docId = ModalRoute.of(context)!.settings.arguments as String;
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Share study')),
        body: Center(
          child: Text(
            "Next Page.\ndocument ID: $docId",
            style: Theme.of(context).textTheme.headline2,
          ),
        ));
  }
}
