import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/profile.dart';

part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required String id,
    required String title,
    required String content,
    required String subjectName,
    String? imageUrl,
    required bool isResolved,
    required Profile questioner,
    required DateTime createdAt,
    required DateTime? updatedAt,
  }) = _Question;
}
