import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/question_list_state.dart';
import 'package:share_study_app/ui/view/timeline/components/question_list_items.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:share_study_app/ui/view/question_post/question_post_screen.dart';

class TimelineScreen extends HookConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionListState = ref.watch(questionListStateProvider);
    return Scaffold(
      body: questionListState.when(
        data: (questions) {
          Logger().d('TimelineScreen data: $questions');
          return AnimationLimiter(
            //AnimationLimiterでラップ
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuestionItem(context, index, questions[index]);
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          Logger().e('TimelineScreen error: $error, stackTrace: $stackTrace');
          return Center(
            child: Text("errorが発生しました, ${error.toString()}"),
          );
        },
      ),
    );
  }
}
