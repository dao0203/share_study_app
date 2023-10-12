import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/ui/util/limit_text_ten_chars.dart';
import 'package:share_study_app/util/date_formatter.dart';

class AnswerItem extends HookConsumerWidget {
  const AnswerItem({
    super.key,
    required this.answer,
    required this.onIconPressed,
    required this.onLongPress,
    required this.questionerId,
    required this.isResolved,
    required this.isMyQuestion,
  });

  final Answer answer;
  final Function() onIconPressed;
  final Function() onLongPress;
  final String questionerId;
  final bool isResolved;
  final bool isMyQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        if (answer.answerer.id == questionerId) {
          Logger().i(
              'answer.answerer.id: ${answer.answerer.id} questionerId: $questionerId');
          return;
        }
        if (isResolved && !answer.isBestAnswer) {
          Logger().i(
              'isResolved: $isResolved answer.isBestAnswer: ${answer.isBestAnswer}');
          return;
        }
        if (!isMyQuestion) {
          Logger().i('isMyQuestion: $isMyQuestion');
          return;
        }
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                answer.isBestAnswer ? 'ベストアンサーを外しますか？' : 'ベストアンサーにしますか？',
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    onLongPress();
                  },
                  child: const Text('はい'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('いいえ'),
                ),
              ],
              elevation: 0,
            );
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onIconPressed(),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: answer.answerer.imageUrl != null
                    ? CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        backgroundImage:
                            NetworkImage(answer.answerer.imageUrl!),
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
                  ],
                ),
                Text(
                  ref.watch(dateFormatterProvider).format(answer.createdAt),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.7),
                  ),
                ),
                Text(
                  answer.content,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  child: answer.imageUrl != null
                      ? Image.network(
                          answer.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )
                      : const SizedBox(),
                  onTap: () {
                    //画像の拡大表示
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: 'Label',
                      transitionDuration: const Duration(milliseconds: 300),
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return DefaultTextStyle(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                  InteractiveViewer(
                                    minScale: 0.1,
                                    maxScale: 5,
                                    child: answer.imageUrl != null
                                        ? Image.network(
                                            answer.imageUrl!,
                                          )
                                        : const SizedBox(),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: SafeArea(
                                      child: CloseButton(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
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
      ),
    );
  }
}
