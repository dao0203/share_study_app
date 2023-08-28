// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Question {
  String get qSubName => throw _privateConstructorUsedError; //科目を格納
  String get email => throw _privateConstructorUsedError; //ユーザーID
  String get lastName => throw _privateConstructorUsedError; //姓
  String get firstName => throw _privateConstructorUsedError; //名
  String get titleContent => throw _privateConstructorUsedError; //タイトル名
  String get questionContent => throw _privateConstructorUsedError; //質問内容
  String get grade => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String qSubName,
      String email,
      String lastName,
      String firstName,
      String titleContent,
      String questionContent,
      String grade});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qSubName = null,
    Object? email = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? titleContent = null,
    Object? questionContent = null,
    Object? grade = null,
  }) {
    return _then(_value.copyWith(
      qSubName: null == qSubName
          ? _value.qSubName
          : qSubName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      titleContent: null == titleContent
          ? _value.titleContent
          : titleContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _value.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String qSubName,
      String email,
      String lastName,
      String firstName,
      String titleContent,
      String questionContent,
      String grade});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qSubName = null,
    Object? email = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? titleContent = null,
    Object? questionContent = null,
    Object? grade = null,
  }) {
    return _then(_$_Question(
      qSubName: null == qSubName
          ? _value.qSubName
          : qSubName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      titleContent: null == titleContent
          ? _value.titleContent
          : titleContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _value.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Question implements _Question {
  const _$_Question(
      {required this.qSubName,
      required this.email,
      required this.lastName,
      required this.firstName,
      required this.titleContent,
      required this.questionContent,
      required this.grade});

  @override
  final String qSubName;
//科目を格納
  @override
  final String email;
//ユーザーID
  @override
  final String lastName;
//姓
  @override
  final String firstName;
//名
  @override
  final String titleContent;
//タイトル名
  @override
  final String questionContent;
//質問内容
  @override
  final String grade;

  @override
  String toString() {
    return 'Question(qSubName: $qSubName, email: $email, lastName: $lastName, firstName: $firstName, titleContent: $titleContent, questionContent: $questionContent, grade: $grade)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.qSubName, qSubName) ||
                other.qSubName == qSubName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.titleContent, titleContent) ||
                other.titleContent == titleContent) &&
            (identical(other.questionContent, questionContent) ||
                other.questionContent == questionContent) &&
            (identical(other.grade, grade) || other.grade == grade));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qSubName, email, lastName,
      firstName, titleContent, questionContent, grade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);
}

abstract class _Question implements Question {
  const factory _Question(
      {required final String qSubName,
      required final String email,
      required final String lastName,
      required final String firstName,
      required final String titleContent,
      required final String questionContent,
      required final String grade}) = _$_Question;

  @override
  String get qSubName;
  @override //科目を格納
  String get email;
  @override //ユーザーID
  String get lastName;
  @override //姓
  String get firstName;
  @override //名
  String get titleContent;
  @override //タイトル名
  String get questionContent;
  @override //質問内容
  String get grade;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
