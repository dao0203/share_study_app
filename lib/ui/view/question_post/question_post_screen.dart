import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/util/image_picker_app.dart';

class QuestionPostScreen extends HookConsumerWidget {
  const QuestionPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d('QuestionPostScreen build');
    final questionRepository = ref.watch(questionRepositoryProvider);
    final titleController = useTextEditingController(text: '');
    final imagePicker = ref.watch(imagePickerAppProvider);
    final subjectController = useTextEditingController(text: '');
    final contentController = useTextEditingController(text: '');
    final areFieldEmpty = useState(true);
    final xFile = useState<XFile?>(null);

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
                    Navigator.pop(context);
                    Logger().d('QuestionPostScreen onPressed');
                    await questionRepository
                        .add(
                      titleController.text,
                      contentController.text,
                      subjectController.text,
                      xFile.value?.path,
                    )
                        .then(
                      (value) {
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
      ),
      //タイトルと科目と本文の入力
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
              const SizedBox(height: 10),

              //画像の選択
              if (xFile.value == null)
                ElevatedButton.icon(
                  onPressed: () async {
                    final pickedFiles =
                        await imagePicker.pickImageFromGallery();
                    if (pickedFiles != null) {
                      xFile.value = pickedFiles;
                    }
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text('ギャラリー'),
                ),
              const SizedBox(height: 10),
              //画像のプレビュー
              Stack(
                children: [
                  if (xFile.value != null)
                    Image.file(
                      File(xFile.value!.path),
                      width: MediaQuery.of(context).size.width,
                    ),
                  if (xFile.value != null)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          xFile.value = null;
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
