import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/custom_snack_bar.dart';

class QuestionReportAlertDialog extends HookConsumerWidget {
  const QuestionReportAlertDialog({super.key, required this.questionId});
  final String questionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reasonController = useTextEditingController();
    final wantToHideQuestion = useState(false);
    final isReasonEmpty = useState(true);
    useEffect(
      () {
        reasonController.addListener(() {
          isReasonEmpty.value = reasonController.text.isEmpty;
        });
        return null;
      },
      [reasonController.text],
    );
    return AlertDialog(
      title: const Text('質問を通報しますか？'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: '通報理由を入力してください',
              ),
            ),
            //通報すると同時に質問を非表示にするかどうかを確認する
            CheckboxListTile(
              title: const Text(
                '質問を非表示にする',
                style: TextStyle(fontSize: 12),
              ),
              value: wantToHideQuestion.value,
              onChanged: (value) {
                wantToHideQuestion.value = value!;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: isReasonEmpty.value
              ? null
              : () async {
                  await ref
                      .read(questionRepositoryProvider)
                      .reportQuestion(
                        questionId: questionId,
                        reason: reasonController.text,
                        wantToHideQuestion: wantToHideQuestion.value,
                      )
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          CustomSnackBar.create(
                            context: context,
                            text: '通報しました',
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      )
                      .catchError(
                        (error) => ScaffoldMessenger.of(context).showSnackBar(
                          CustomSnackBar.createError(
                            context: context,
                            text: '通報に失敗しました',
                            icon: Icon(
                              Icons.error_outline,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      )
                      .whenComplete(() => Navigator.of(context).pop());
                },
          child: const Text('通報する'),
        ),
      ],
    );
  }
}
