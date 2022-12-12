// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) {
  return _QuestionData.fromJson(json);
}

/// @nodoc
mixin _$QuestionData {
  String get qSubId => throw _privateConstructorUsedError; //科目を格納
  String get qId => throw _privateConstructorUsedError; //質問ID
  String get userId => throw _privateConstructorUsedError; //ユーザーID
  String get titleContent => throw _privateConstructorUsedError; //タイトル名
  String get questionContent => throw _privateConstructorUsedError; //質問内容
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionDataCopyWith<QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDataCopyWith<$Res> {
  factory $QuestionDataCopyWith(
          QuestionData value, $Res Function(QuestionData) then) =
      _$QuestionDataCopyWithImpl<$Res, QuestionData>;
  @useResult
  $Res call(
      {String qSubId,
      String qId,
      String userId,
      String titleContent,
      String questionContent,
      String email});
}

/// @nodoc
class _$QuestionDataCopyWithImpl<$Res, $Val extends QuestionData>
    implements $QuestionDataCopyWith<$Res> {
  _$QuestionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qSubId = null,
    Object? qId = null,
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
      qId: null == qId
          ? _value.qId
          : qId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_QuestionDataCopyWith<$Res>
    implements $QuestionDataCopyWith<$Res> {
  factory _$$_QuestionDataCopyWith(
          _$_QuestionData value, $Res Function(_$_QuestionData) then) =
      __$$_QuestionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String qSubId,
      String qId,
      String userId,
      String titleContent,
      String questionContent,
      String email});
}

/// @nodoc
class __$$_QuestionDataCopyWithImpl<$Res>
    extends _$QuestionDataCopyWithImpl<$Res, _$_QuestionData>
    implements _$$_QuestionDataCopyWith<$Res> {
  __$$_QuestionDataCopyWithImpl(
      _$_QuestionData _value, $Res Function(_$_QuestionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qSubId = null,
    Object? qId = null,
    Object? userId = null,
    Object? titleContent = null,
    Object? questionContent = null,
    Object? email = null,
  }) {
    return _then(_$_QuestionData(
      qSubId: null == qSubId
          ? _value.qSubId
          : qSubId // ignore: cast_nullable_to_non_nullable
              as String,
      qId: null == qId
          ? _value.qId
          : qId // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$_QuestionData with DiagnosticableTreeMixin implements _QuestionData {
  const _$_QuestionData(
      {required this.qSubId,
      required this.qId,
      required this.userId,
      required this.titleContent,
      required this.questionContent,
      required this.email});

  factory _$_QuestionData.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionDataFromJson(json);

  @override
  final String qSubId;
//科目を格納
  @override
  final String qId;
//質問ID
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
    return 'QuestionData(qSubId: $qSubId, qId: $qId, userId: $userId, titleContent: $titleContent, questionContent: $questionContent, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionData'))
      ..add(DiagnosticsProperty('qSubId', qSubId))
      ..add(DiagnosticsProperty('qId', qId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('titleContent', titleContent))
      ..add(DiagnosticsProperty('questionContent', questionContent))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionData &&
            (identical(other.qSubId, qSubId) || other.qSubId == qSubId) &&
            (identical(other.qId, qId) || other.qId == qId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.titleContent, titleContent) ||
                other.titleContent == titleContent) &&
            (identical(other.questionContent, questionContent) ||
                other.questionContent == questionContent) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, qSubId, qId, userId, titleContent, questionContent, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionDataCopyWith<_$_QuestionData> get copyWith =>
      __$$_QuestionDataCopyWithImpl<_$_QuestionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionDataToJson(
      this,
    );
  }
}

abstract class _QuestionData implements QuestionData {
  const factory _QuestionData(
      {required final String qSubId,
      required final String qId,
      required final String userId,
      required final String titleContent,
      required final String questionContent,
      required final String email}) = _$_QuestionData;

  factory _QuestionData.fromJson(Map<String, dynamic> json) =
      _$_QuestionData.fromJson;

  @override
  String get qSubId;
  @override //科目を格納
  String get qId;
  @override //質問ID
  String get userId;
  @override //ユーザーID
  String get titleContent;
  @override //タイトル名
  String get questionContent;
  @override //質問内容
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionDataCopyWith<_$_QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}
