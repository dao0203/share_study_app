import 'package:freezed_annotation/freezed_annotation.dart';

part 'questioner.freezed.dart';

@freezed
abstract class Questioner with _$Questioner {
  const factory Questioner({
    @Default('') String id,
    @Default('') String nickname,
    String? imageUrl,
  }) = _Questioner;
}
