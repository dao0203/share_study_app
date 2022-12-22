// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_browse_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionBrowseData {
  String get title => throw _privateConstructorUsedError; //タイトル
  String get textContent => throw _privateConstructorUsedError; //質問内容
  String get subName => throw _privateConstructorUsedError; //教科名
  String get email => throw _privateConstructorUsedError; //メールアドレス
  String get questionId => throw _privateConstructorUsedError; //質問ID
  DateTime get answerCreatedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionBrowseDataCopyWith<QuestionBrowseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionBrowseDataCopyWith<$Res> {
  factory $QuestionBrowseDataCopyWith(
          QuestionBrowseData value, $Res Function(QuestionBrowseData) then) =
      _$QuestionBrowseDataCopyWithImpl<$Res, QuestionBrowseData>;
  @useResult
  $Res call(
      {String title,
      String textContent,
      String subName,
      String email,
      String questionId,
      DateTime answerCreatedDate});
}

/// @nodoc
class _$QuestionBrowseDataCopyWithImpl<$Res, $Val extends QuestionBrowseData>
    implements $QuestionBrowseDataCopyWith<$Res> {
  _$QuestionBrowseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? textContent = null,
    Object? subName = null,
    Object? email = null,
    Object? questionId = null,
    Object? answerCreatedDate = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textContent: null == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String,
      subName: null == subName
          ? _value.subName
          : subName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answerCreatedDate: null == answerCreatedDate
          ? _value.answerCreatedDate
          : answerCreatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionBrowseDataCopyWith<$Res>
    implements $QuestionBrowseDataCopyWith<$Res> {
  factory _$$_QuestionBrowseDataCopyWith(_$_QuestionBrowseData value,
          $Res Function(_$_QuestionBrowseData) then) =
      __$$_QuestionBrowseDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String textContent,
      String subName,
      String email,
      String questionId,
      DateTime answerCreatedDate});
}

/// @nodoc
class __$$_QuestionBrowseDataCopyWithImpl<$Res>
    extends _$QuestionBrowseDataCopyWithImpl<$Res, _$_QuestionBrowseData>
    implements _$$_QuestionBrowseDataCopyWith<$Res> {
  __$$_QuestionBrowseDataCopyWithImpl(
      _$_QuestionBrowseData _value, $Res Function(_$_QuestionBrowseData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? textContent = null,
    Object? subName = null,
    Object? email = null,
    Object? questionId = null,
    Object? answerCreatedDate = null,
  }) {
    return _then(_$_QuestionBrowseData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textContent: null == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String,
      subName: null == subName
          ? _value.subName
          : subName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answerCreatedDate: null == answerCreatedDate
          ? _value.answerCreatedDate
          : answerCreatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_QuestionBrowseData
    with DiagnosticableTreeMixin
    implements _QuestionBrowseData {
  const _$_QuestionBrowseData(
      {required this.title,
      required this.textContent,
      required this.subName,
      required this.email,
      required this.questionId,
      required this.answerCreatedDate});

  @override
  final String title;
//タイトル
  @override
  final String textContent;
//質問内容
  @override
  final String subName;
//教科名
  @override
  final String email;
//メールアドレス
  @override
  final String questionId;
//質問ID
  @override
  final DateTime answerCreatedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionBrowseData(title: $title, textContent: $textContent, subName: $subName, email: $email, questionId: $questionId, answerCreatedDate: $answerCreatedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionBrowseData'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('textContent', textContent))
      ..add(DiagnosticsProperty('subName', subName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('questionId', questionId))
      ..add(DiagnosticsProperty('answerCreatedDate', answerCreatedDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionBrowseData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.textContent, textContent) ||
                other.textContent == textContent) &&
            (identical(other.subName, subName) || other.subName == subName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerCreatedDate, answerCreatedDate) ||
                other.answerCreatedDate == answerCreatedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, textContent, subName,
      email, questionId, answerCreatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionBrowseDataCopyWith<_$_QuestionBrowseData> get copyWith =>
      __$$_QuestionBrowseDataCopyWithImpl<_$_QuestionBrowseData>(
          this, _$identity);
}

abstract class _QuestionBrowseData implements QuestionBrowseData {
  const factory _QuestionBrowseData(
      {required final String title,
      required final String textContent,
      required final String subName,
      required final String email,
      required final String questionId,
      required final DateTime answerCreatedDate}) = _$_QuestionBrowseData;

  @override
  String get title;
  @override //タイトル
  String get textContent;
  @override //質問内容
  String get subName;
  @override //教科名
  String get email;
  @override //メールアドレス
  String get questionId;
  @override //質問ID
  DateTime get answerCreatedDate;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionBrowseDataCopyWith<_$_QuestionBrowseData> get copyWith =>
      throw _privateConstructorUsedError;
}
