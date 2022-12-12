// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionData _$$_QuestionDataFromJson(Map<String, dynamic> json) =>
    _$_QuestionData(
      qSubId: json['qSubId'] as String,
      qId: json['qId'] as String,
      userId: json['userId'] as String,
      titleContent: json['titleContent'] as String,
      questionContent: json['questionContent'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_QuestionDataToJson(_$_QuestionData instance) =>
    <String, dynamic>{
      'qSubId': instance.qSubId,
      'qId': instance.qId,
      'userId': instance.userId,
      'titleContent': instance.titleContent,
      'questionContent': instance.questionContent,
      'email': instance.email,
    };
