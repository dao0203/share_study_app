import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.freezed.dart';

@freezed
abstract class Registration with _$Registration {
  const factory Registration({
    required String email, //メールアドレス
    required String firstName, //名
    required String lastName, //姓
    required String password, //パスワード
    required String grade,
  }) = _Registration;
}
