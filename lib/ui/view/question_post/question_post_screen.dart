import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

class QuestionPostScreen extends HookConsumerWidget {
  const QuestionPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d('QuestionPostScreen build');
    final questionRepository = ref.watch(questionRepositoryProvider);
    final titleController = useTextEditingController(text: '');
    final subjectController = useTextEditingController(text: '');
    final contentController = useTextEditingController(text: '');
    final areFieldEmpty = useState(true);

    bool checkIfFieldsAreEmpty() {
      return titleController.text.isEmpty ||
          subjectController.text.isEmpty ||
          contentController.text.isEmpty;
    }

    useEffect(() {
      Logger().d('QuestionPostScreen useEffect');
      titleController.addListener(() {
        areFieldEmpty.value = checkIfFieldsAreEmpty();
      });
      subjectController.addListener(() {
        areFieldEmpty.value = checkIfFieldsAreEmpty();
      });
      contentController.addListener(() {
        areFieldEmpty.value = checkIfFieldsAreEmpty();
      });
      return null;
    }, [titleController, subjectController, contentController]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ElevatedButton.icon(
            onPressed: areFieldEmpty.value
                ? null
                : () async {
                    //キーボードを閉じる
                    FocusScope.of(context).unfocus();
                    //最初にスナックバーを表示
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.white,
                        content: const Row(
                          children: [
                            CircularProgressIndicator(
                              // ローディングアニメーション
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '質問を投稿しています...',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                        // SnackBarの表示時間を設定
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        showCloseIcon: true,
                        elevation: 4.0,
                        closeIconColor: Colors.black,
                        clipBehavior: Clip.hardEdge,
                        dismissDirection: DismissDirection.horizontal,
                      ),
                    );
                    Navigator.pop(context);
                    Logger().d('QuestionPostScreen onPressed');
                    await questionRepository
                        .add(
                      titleController.text,
                      contentController.text,
                      subjectController.text,
                    )
                        .then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    '質問が投稿できました！',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: true,
                            elevation: 4.0,
                            backgroundColor: Colors.white,
                            closeIconColor: Colors.green,
                            clipBehavior: Clip.hardEdge,
                            dismissDirection: DismissDirection.horizontal,
                          ),
                        );
                      },
                    ).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16),
                        margin: const EdgeInsetsDirectional.all(16),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                              Text(
                                '質問の投稿に失敗しました: $error',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        behavior: SnackBarBehavior.floating,
                        showCloseIcon: true,
                        elevation: 4.0,
                        backgroundColor: Colors.white,
                        closeIconColor: Colors.red,
                        clipBehavior: Clip.hardEdge,
                        dismissDirection: DismissDirection.horizontal,
                      ));
                    });
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: areFieldEmpty.value
                  ? null
                  : Theme.of(context).colorScheme.background,
            ),
            icon: Icon(
              Icons.send,
              color: areFieldEmpty.value
                  ? null
                  : Theme.of(context).colorScheme.onBackground,
            ),
            label: Text(
              '投稿',
              style: TextStyle(
                color: areFieldEmpty.value
                    ? null
                    : Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ), //タイトルと科目と本文の入力
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'タイトル',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextField(
                controller: subjectController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: '科目',
                  prefixIcon: Icon(Icons.menu_book),
                ),
              ),
              TextField(
                controller: contentController,
                maxLength: 200,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: '本文',
                  prefixIcon: Icon(Icons.subject),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
