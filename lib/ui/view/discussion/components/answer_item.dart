import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/ui/util/limit_text_ten_chars.dart';

class AnswerItem extends HookConsumerWidget {
  const AnswerItem(
      {super.key, required this.answer, required this.onIconPressed});
  final Answer answer;
  final Function() onIconPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => onIconPressed(),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: answer.answerer.imageUrl != null
                  ? CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      backgroundImage: NetworkImage(answer.answerer.imageUrl!),
                      radius: 20,
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
              Row(
                children: [
                  Text(
                    limitTextTenChars(answer.answerer.nickname),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${answer.createdAt.month}月${answer.createdAt.day}日',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                answer.content,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              answer.isBestAnswer
                  ? 'assets/icons/crown.svg'
                  : 'assets/icons/crown-outlined.svg',
              colorFilter: ColorFilter.mode(
                answer.isBestAnswer
                    ? Colors.yellow
                    : Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
