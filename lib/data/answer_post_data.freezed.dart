// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnswerPostData {
  String get email => throw _privateConstructorUsedError; //email
  String get answerText => throw _privateConstructorUsedError; //解答
  String get questionId => throw _privateConstructorUsedError; //質問ID
  String get lastName => throw _privateConstructorUsedError; //姓
  String get firstName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerPostDataCopyWith<AnswerPostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerPostDataCopyWith<$Res> {
  factory $AnswerPostDataCopyWith(
          AnswerPostData value, $Res Function(AnswerPostData) then) =
      _$AnswerPostDataCopyWithImpl<$Res, AnswerPostData>;
  @useResult
  $Res call(
      {String email,
      String answerText,
      String questionId,
      String lastName,
      String firstName});
}

/// @nodoc
class _$AnswerPostDataCopyWithImpl<$Res, $Val extends AnswerPostData>
    implements $AnswerPostDataCopyWith<$Res> {
  _$AnswerPostDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? answerText = null,
    Object? questionId = null,
    Object? lastName = null,
    Object? firstName = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      answerText: null == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerPostDataCopyWith<$Res>
    implements $AnswerPostDataCopyWith<$Res> {
  factory _$$_AnswerPostDataCopyWith(
          _$_AnswerPostData value, $Res Function(_$_AnswerPostData) then) =
      __$$_AnswerPostDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String answerText,
      String questionId,
      String lastName,
      String firstName});
}

/// @nodoc
class __$$_AnswerPostDataCopyWithImpl<$Res>
    extends _$AnswerPostDataCopyWithImpl<$Res, _$_AnswerPostData>
    implements _$$_AnswerPostDataCopyWith<$Res> {
  __$$_AnswerPostDataCopyWithImpl(
      _$_AnswerPostData _value, $Res Function(_$_AnswerPostData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? answerText = null,
    Object? questionId = null,
    Object? lastName = null,
    Object? firstName = null,
  }) {
    return _then(_$_AnswerPostData(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      answerText: null == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AnswerPostData implements _AnswerPostData {
  const _$_AnswerPostData(
      {required this.email,
      required this.answerText,
      required this.questionId,
      required this.lastName,
      required this.firstName});

  @override
  final String email;
//email
  @override
  final String answerText;
//解答
  @override
  final String questionId;
//質問ID
  @override
  final String lastName;
//姓
  @override
  final String firstName;

  @override
  String toString() {
    return 'AnswerPostData(email: $email, answerText: $answerText, questionId: $questionId, lastName: $lastName, firstName: $firstName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerPostData &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, answerText, questionId, lastName, firstName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerPostDataCopyWith<_$_AnswerPostData> get copyWith =>
      __$$_AnswerPostDataCopyWithImpl<_$_AnswerPostData>(this, _$identity);
}

abstract class _AnswerPostData implements AnswerPostData {
  const factory _AnswerPostData(
      {required final String email,
      required final String answerText,
      required final String questionId,
      required final String lastName,
      required final String firstName}) = _$_AnswerPostData;

  @override
  String get email;
  @override //email
  String get answerText;
  @override //解答
  String get questionId;
  @override //質問ID
  String get lastName;
  @override //姓
  String get firstName;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerPostDataCopyWith<_$_AnswerPostData> get copyWith =>
      throw _privateConstructorUsedError;
}
