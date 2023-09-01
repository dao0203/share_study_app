import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPostScreen extends StatefulHookConsumerWidget {
  const QuestionPostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionPostScreenState();
}

class _QuestionPostScreenState extends ConsumerState<QuestionPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            label: Text(
              '投稿',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
      //タイトルと科目と本文の入力
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'タイトル',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '科目',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '本文',
            ),
          ),
        ],
      ),
    );
  }
}
