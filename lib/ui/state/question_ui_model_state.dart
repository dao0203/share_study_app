import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_study_app/ui/ui_model/question_ui_model.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';

part 'question_ui_model_state.g.dart';

@riverpod
class QuestionUiModelState extends _$QuestionUiModelState {
  @override
  Future<QuestionUiModel> build(String questionId) async {
    return await ref
        .watch(getQuestionUseCaseProvider)
        .call(questionId)
        .then((value) {
      return QuestionUiModel.fromQuestionUseCaseModel(
        questionUseCaseModel: value,
      );
    });
  }
}
