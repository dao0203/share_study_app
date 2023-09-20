import 'package:freezed_annotation/freezed_annotation.dart';

part 'answerer.freezed.dart';

@freezed
abstract class Answerer with _$Answerer {
  const factory Answerer({
    @Default('') String id,
    @Default('') String lastName,
    @Default('') String firstName,
    @Default('') String grade,
    @Default('') String imageUrl,
  }) = _Answerer;
}
