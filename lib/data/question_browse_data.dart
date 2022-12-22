import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'question_browse_data.freezed.dart';

@freezed
class QuestionBrowseData with _$QuestionBrowseData {
  const factory QuestionBrowseData({
    required String title, //タイトル
    required String textContent, //質問内容
    required String subName, //教科名
    required String email, //メールアドレス
    required String questionId, //質問ID
    required DateTime answerCreatedDate, //質問の作成日
  }) = _QuestionBrowseData;
}
