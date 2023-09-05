import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/question.dart';

class QuestionItem extends HookConsumerWidget {
  final Question question;
  final Function(bool bookmarked) onBookmarkPressed;

  const QuestionItem({
    super.key,
    required this.question,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = useState(question.isResolved);
    return Card(
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
                  : const Icon(Icons.person_outline_outlined, size: 40),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //ユーザの名前
                Text(
                  question.questioner.nickname,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [],
                ),
              ],
            ),
          ),
          //解決したかどうかを判定するアイコン
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check_circle_outline,
              color: question.isResolved ? Colors.green : Colors.grey,
            ),
          ),
          //ブックマークしたかどうかを判定するアイコン
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                isLiked.value ? Icons.bookmark : Icons.bookmark_outline,
                color: isLiked.value ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                isLiked.value = !isLiked.value;
                onBookmarkPressed(isLiked.value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
