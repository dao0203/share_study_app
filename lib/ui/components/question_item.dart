import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/question_report_alert_dialog.dart';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4, top: 8),
                child: Icon(
                  Icons.check_circle_outline,
                  color:
                      questionUiModel.isResolved ? Colors.green : Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          child: Column(
                            children: [
                              questionUiModel.isMyQuestion
                                  ? ListTile(
                                      leading: const Icon(Icons.delete),
                                      title: const Text('質問を削除'),
                                      onTap: () {
                                        ref
                                            .watch(questionRepositoryProvider)
                                            .delete(
                                                questionId: questionUiModel.id);
                                      },
                                    )
                                  : const SizedBox(),
                              //通報
                              questionUiModel.isMyQuestion
                                  ? const SizedBox()
                                  : ListTile(
                                      leading: const Icon(Icons.report),
                                      title: const Text('通報'),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return QuestionReportAlertDialog(
                                              questionId: questionUiModel.id,
                                            );
                                          },
                                        );
                                      },
                                    ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
