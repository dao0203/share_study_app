import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    required String id,
    required int questionCount,
    required int answerCount,
    required int bestAnswerCount,
  }) = _Activity;
}
