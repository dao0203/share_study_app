import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/profile.dart';

part 'activity_profile.freezed.dart';

@freezed
abstract class ActivityProfile with _$ActivityProfile {
  const factory ActivityProfile({
    required Profile profile,
    required int questionCount,
    required int answerCount,
    required int bestAnswerCount,
    required bool isMyProfile,
  }) = _ActivityProfile;
}
