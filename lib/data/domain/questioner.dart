import 'package:freezed_annotation/freezed_annotation.dart';

part 'questioner.freezed.dart';

@freezed
abstract class Questioner with _$Questioner {
  const factory Questioner({
    @Default("") String id,
    @Default("") String lastName, //姓
    @Default("") String firstName, //名
    @Default("") String grade, //学年
    @Default("") String imageUrl,
  }) = _Questioner;
}
