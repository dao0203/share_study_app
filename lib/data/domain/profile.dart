import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String nickname,
    required String universityName,
    @Default(-1) int followCount,
    @Default(-1) int followerCount,
    String? imageUrl,
    String? facultyName,
    String? departmentName,
    String? grade,
    String? bio,
  }) = _Profile;
}
