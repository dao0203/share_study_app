import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/question_use_case_model.dart';

part 'question_ui_model.freezed.dart';

@freezed
abstract class QuestionUiModel with _$QuestionUiModel {
  const factory QuestionUiModel({
    //質問
    required String id,
    required String title,
    required String content,
    required String subjectName,
    String? questionImageUrl,
    required bool isResolved,
    //質問者
    required String questionerId,
    required String questionerNickname,
    String? questionerImageUrl,
    required DateTime createdAt,
    required DateTime? updatedAt,
    required bool isMyQuestion,
  }) = _QuestionUiModel;

  factory QuestionUiModel.fromQuestionUseCaseModel({
    required QuestionUseCaseModel questionUseCaseModel,
  }) {
    return QuestionUiModel(
      id: questionUseCaseModel.question.id,
      title: questionUseCaseModel.question.title,
      content: questionUseCaseModel.question.content,
      subjectName: questionUseCaseModel.question.subjectName,
      questionImageUrl: questionUseCaseModel.question.imageUrl,
      isResolved: questionUseCaseModel.question.isResolved,
      questionerId: questionUseCaseModel.question.questioner.id,
      questionerNickname: questionUseCaseModel.question.questioner.nickname,
      questionerImageUrl: questionUseCaseModel.question.questioner.imageUrl,
      createdAt: questionUseCaseModel.question.createdAt,
      updatedAt: questionUseCaseModel.question.updatedAt,
      isMyQuestion: questionUseCaseModel.isMyQuestion,
    );
  }
}
