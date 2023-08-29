import 'package:freezed_annotation/freezed_annotation.dart';

part 'university.freezed.dart';

@freezed
class University with _$University {
  const factory University({
    @Default('') String id,
    @Default('') String name,
    @Default('') String fuculty,
    @Default('') String department,
  }) = _University;
}
