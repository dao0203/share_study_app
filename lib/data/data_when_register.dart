import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_when_register.freezed.dart';

@freezed
class DataWhenRegister with _$DataWhenRegister {
  const factory DataWhenRegister({
    required String googleAccountId, //グーグルアカウントID
    required String firstName, //名
    required String lastName, //姓
    required String email, //メールアドレス
  }) = _DataWhenRegister;
}