import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

part 'question_list_state.g.dart';

@riverpod
class QuestionListState extends _$QuestionListState {
  @override
  Future<List<Question>> build() async {
    return await ref.watch(questionRepositoryProvider).getWithPagination(1, 0);
  }
}
