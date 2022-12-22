/**
 * 必要なパッケージのインストールとして下記を実行
 * flutter pub run build_runner build --delete-conflicting-outputs
 * 参考：https://pub.dev/packages/freezed
 * flutter pub add freezed_annotation
 * flutter pub add --dev build_runner
 * flutter pub add --dev freezed
 * flutter pub add json_annotation
 * flutter pub add --dev json_serializable
 * 参考：https://github.com/rrousselGit/freezed
 */
// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'question_post_data.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.

@freezed
class QuestionPostData with _$QuestionPostData {
  const factory QuestionPostData({
    required String qSubId, //科目を格納
    required String qId, //質問ID
    required String userId, //ユーザーID
    required String titleContent, //タイトル名
    required String questionContent, //質問内容
    required String email,
    // required String attFiles,
  }) = _QuestionPostData;
}