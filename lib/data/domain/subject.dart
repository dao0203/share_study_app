import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';

@freezed
abstract class Subject with _$Subject {
  const factory Subject({
    @Default("") String id,
    @Default("") String name,
    @Default("") String course,
  }) = _Subject;
}
