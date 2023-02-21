// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionPostData {
  String get qSubId => throw _privateConstructorUsedError; //科目を格納
  String get userId => throw _privateConstructorUsedError; //ユーザーID
  String get titleContent => throw _privateConstructorUsedError; //タイトル名
  String get questionContent => throw _privateConstructorUsedError; //質問内容
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionPostDataCopyWith<QuestionPostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPostDataCopyWith<$Res> {
  factory $QuestionPostDataCopyWith(
          QuestionPostData value, $Res Function(QuestionPostData) then) =
      _$QuestionPostDataCopyWithImpl<$Res, QuestionPostData>;
  @useResult
  $Res call(
      {String qSubId,
      String userId,
      String titleContent,
      String questionContent,
      String email});
}

/// @nodoc
class _$QuestionPostDataCopyWithImpl<$Res, $Val extends QuestionPostData>
    implements $QuestionPostDataCopyWith<$Res> {
  _$QuestionPostDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qSubId = null,
    Object? userId = null,
    Object? titleContent = null,
    Object? questionContent = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      qSubId: null == qSubId
          ? _value.qSubId
          : qSubId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      titleContent: null == titleContent
          ? _value.titleContent
          : titleContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _value.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionPostDataCopyWith<$Res>
    implements $QuestionPostDataCopyWith<$Res> {
  factory _$$_QuestionPostDataCopyWith(
          _$_QuestionPostData value, $Res Function(_$_QuestionPostData) then) =
      __$$_QuestionPostDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String qSubId,
      String userId,
      String titleContent,
      String questionContent,
      String email});
}

/// @nodoc
class __$$_QuestionPostDataCopyWithImpl<$Res>
    extends _$QuestionPostDataCopyWithImpl<$Res, _$_QuestionPostData>
    implements _$$_QuestionPostDataCopyWith<$Res> {
  __$$_QuestionPostDataCopyWithImpl(
      _$_QuestionPostData _value, $Res Function(_$_QuestionPostData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qSubId = null,
    Object? userId = null,
    Object? titleContent = null,
    Object? questionContent = null,
    Object? email = null,
  }) {
    return _then(_$_QuestionPostData(
      qSubId: null == qSubId
          ? _value.qSubId
          : qSubId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      titleContent: null == titleContent
          ? _value.titleContent
          : titleContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _value.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QuestionPostData
    with DiagnosticableTreeMixin
    implements _QuestionPostData {
  const _$_QuestionPostData(
      {required this.qSubId,
      required this.userId,
      required this.titleContent,
      required this.questionContent,
      required this.email});

  @override
  final String qSubId;
//科目を格納
  @override
  final String userId;
//ユーザーID
  @override
  final String titleContent;
//タイトル名
  @override
  final String questionContent;
//質問内容
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionPostData(qSubId: $qSubId, userId: $userId, titleContent: $titleContent, questionContent: $questionContent, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionPostData'))
      ..add(DiagnosticsProperty('qSubId', qSubId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('titleContent', titleContent))
      ..add(DiagnosticsProperty('questionContent', questionContent))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionPostData &&
            (identical(other.qSubId, qSubId) || other.qSubId == qSubId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.titleContent, titleContent) ||
                other.titleContent == titleContent) &&
            (identical(other.questionContent, questionContent) ||
                other.questionContent == questionContent) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, qSubId, userId, titleContent, questionContent, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionPostDataCopyWith<_$_QuestionPostData> get copyWith =>
      __$$_QuestionPostDataCopyWithImpl<_$_QuestionPostData>(this, _$identity);
}

abstract class _QuestionPostData implements QuestionPostData {
  const factory _QuestionPostData(
      {required final String qSubId,
      required final String userId,
      required final String titleContent,
      required final String questionContent,
      required final String email}) = _$_QuestionPostData;

  @override
  String get qSubId;
  @override //科目を格納
  String get userId;
  @override //ユーザーID
  String get titleContent;
  @override //タイトル名
  String get questionContent;
  @override //質問内容
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionPostDataCopyWith<_$_QuestionPostData> get copyWith =>
      throw _privateConstructorUsedError;
}
