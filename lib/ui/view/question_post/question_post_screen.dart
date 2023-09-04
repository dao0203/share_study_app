import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/question.dart';
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
                      const SnackBar(
                        content: Text('質問を投稿しています...'),
                      ),
                    );
                    Logger().d('QuestionPostScreen onPressed');
                    await questionRepository
                        .add(
                      Question(
                        title: titleController.text,
                        subjectName: subjectController.text,
                        content: contentController.text,
                      ),
                    )
                        .then(
                      (value) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('質問を投稿しました'),
                          ),
                        );
                      },
                    ).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('質問の投稿に失敗しました: $error'),
                        ),
                      );
                    });
                  },
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
          const SizedBox(width: 10)
        ],
      ),
      //タイトルと科目と本文の入力
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLength: 30,
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
