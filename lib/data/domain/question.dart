import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/questioner.dart';
import 'package:share_study_app/data/domain/subject.dart';

part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    @Default("") String id,
    @Default("") String title,
    @Default("") String qSubName,
    @Default("") String content,
    @Default("") String imageUrl,
    @Default(false) bool isResolved,
    @Default(Questioner()) Questioner questioner,
    @Default(Subject()) Subject subject,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Question;
}
