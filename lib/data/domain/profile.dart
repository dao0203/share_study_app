import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String nickname,
    required String universityName,
    int? followCount,
    int? followerCount,
    int? questionCount,
    int? answerCount,
    int? bestAnswerCount,
    String? imageUrl,
    String? facultyName,
    String? departmentName,
    String? grade,
    String? bio,
  }) = _Profile;
}
