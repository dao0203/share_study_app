// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionData _$$_QuestionDataFromJson(Map<String, dynamic> json) =>
    _$_QuestionData(
      dropDownLists: (json['dropDownLists'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      userId: json['userId'] as String,
      titleContent: json['titleContent'] as String,
      questionContent: json['questionContent'] as String,
    );

Map<String, dynamic> _$$_QuestionDataToJson(_$_QuestionData instance) =>
    <String, dynamic>{
      'dropDownLists': instance.dropDownLists,
      'id': instance.id,
      'userId': instance.userId,
      'titleContent': instance.titleContent,
      'questionContent': instance.questionContent,
    };
