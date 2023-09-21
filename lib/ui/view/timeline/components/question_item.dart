import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/question.dart';

class QuestionItem extends HookConsumerWidget {
  final Question question;
  final Function() onPressed;

  const QuestionItem({
    super.key,
    required this.question,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: question.questioner.imageUrl != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(question.questioner.imageUrl!),
                        //サイズ
                        radius: 40,
                      )
                    : Icon(
                        Icons.person_outline_outlined,
                        size: 40,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        question.questioner.nickname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${question.createdAt.month}月${question.createdAt.day}日',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    question.title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    question.isResolved
                        ? Icons.check_box
                        : Icons.check_circle_outline,
                    color: question.isResolved ? Colors.green : Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
