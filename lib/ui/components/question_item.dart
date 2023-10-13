import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/ui/ui_model/question_ui_model.dart';
import 'package:share_study_app/ui/util/limit_text_ten_chars.dart';
import 'package:share_study_app/util/date_formatter.dart';

class QuestionItem extends HookConsumerWidget {
  final QuestionUiModel questionUiModel;
  final Function() onPressed;
  final Function() onIconPressed;

  const QuestionItem({
    super.key,
    required this.questionUiModel,
    required this.onPressed,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onPressed(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => onIconPressed(),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: questionUiModel.questionerImageUrl != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(questionUiModel.questionerImageUrl!),
                        //サイズ
                        radius: 20,
                        backgroundColor: Colors.transparent,
                      )
                    : Icon(
                        Icons.person_outline_outlined,
                        size: 40,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  limitTextTenChars(questionUiModel.questionerNickname),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  ref
                      .watch(dateFormatterProvider)
                      .format(questionUiModel.createdAt),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  questionUiModel.tags,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  questionUiModel.title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color:
                      questionUiModel.isResolved ? Colors.green : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
