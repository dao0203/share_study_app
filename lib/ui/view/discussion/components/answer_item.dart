import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/answer.dart';

class AnswerItem extends HookConsumerWidget {
  const AnswerItem({super.key, required this.answer});
  final Answer answer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ListTile(
      title: Text(answer.content),
    ));
  }
}
