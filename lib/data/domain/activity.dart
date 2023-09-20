import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    @Default('') String id,
    @Default(-1) int followCount,
    @Default(-1) int followerCount,
    @Default(-1) int questionCount,
    @Default(-1) int answerCount,
    @Default(-1) int bestAnswerCount,
    @Default(-1) int repostCount,
    @Default(-1) int likeCount,
  }) = _Activity;
}
