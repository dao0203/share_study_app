import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _QuestionUiModel;
}
