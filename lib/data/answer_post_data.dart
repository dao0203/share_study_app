//
//   必要なパッケージのインストールとして下記を実行
//   flutter pub run build_runner build --delete-conflicting-outputs
//   参考：https://pub.dev/packages/freezed
//   flutter pub add freezed_annotation
//   flutter pub add --dev build_runner
//   flutter pub add --dev freezed
//   flutter pub add json_annotation
//   flutter pub add --dev json_serializable
//   参考：https://github.com/rrousselGit/freezed
//
// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'answer_post_data.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.

@freezed
class AnswerPostData with _$AnswerPostData {
  const factory AnswerPostData(
      {required String answerText, //解答
      required String email, //email
      required String questionId}) = _AnswerPostData;
}
