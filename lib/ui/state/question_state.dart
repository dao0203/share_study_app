import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

part 'question_state.g.dart';

@riverpod
class QuestionState extends _$QuestionState {
  @override
  Future<Question> build(String questionId) async {
    return await ref.watch(questionRepositoryProvider).get(questionId);
  }
}
