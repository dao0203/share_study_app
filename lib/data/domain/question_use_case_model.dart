import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/question.dart';

part 'question_use_case_model.freezed.dart';

@freezed
class QuestionUseCaseModel with _$QuestionUseCaseModel {
  const factory QuestionUseCaseModel({
    required Question question,
    required bool isMyQuestion,
  }) = _QuestionUseCaseModel;
}
