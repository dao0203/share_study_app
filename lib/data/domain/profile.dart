import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String nickname,
    String? imageUrl,
    required String universityName,
    String? facultyName,
    String? departmentName,
    String? grade,
    String? bio,
  }) = _Profile;
}
