import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/timeline/components/question_list_items.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:share_study_app/ui/view/question_post/question_post_screen.dart';

class TimelineScreen extends HookConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionRepository = ref.watch(questionRepositoryProvider);
    return Scaffold(
      body: FutureBuilder(
          future: questionRepository.getQuestions(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //エラーが発生した場合
              return const Center(
                child: Text("errorが発生しました"),
              );
            } else if (!snapshot.hasData) {
              //データの読み込み中
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //質問リストを表示
            return AnimationLimiter(
              //AnimationLimiterでラップ
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return QuestionItem(context, index, snapshot.data![index]);
                },
              ),
            );
          }),
    );
  }
}
