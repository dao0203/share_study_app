// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionUiModel {
//質問
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String? get questionImageUrl => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError; //質問者
  String get questionerId => throw _privateConstructorUsedError;
  String get questionerNickname => throw _privateConstructorUsedError;
  String? get questionerImageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionUiModelCopyWith<QuestionUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionUiModelCopyWith<$Res> {
  factory $QuestionUiModelCopyWith(
          QuestionUiModel value, $Res Function(QuestionUiModel) then) =
      _$QuestionUiModelCopyWithImpl<$Res, QuestionUiModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String subjectName,
      String? questionImageUrl,
      bool isResolved,
      String questionerId,
      String questionerNickname,
      String? questionerImageUrl,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$QuestionUiModelCopyWithImpl<$Res, $Val extends QuestionUiModel>
    implements $QuestionUiModelCopyWith<$Res> {
  _$QuestionUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? subjectName = null,
    Object? questionImageUrl = freezed,
    Object? isResolved = null,
    Object? questionerId = null,
    Object? questionerNickname = null,
    Object? questionerImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      questionImageUrl: freezed == questionImageUrl
          ? _value.questionImageUrl
          : questionImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      questionerId: null == questionerId
          ? _value.questionerId
          : questionerId // ignore: cast_nullable_to_non_nullable
              as String,
      questionerNickname: null == questionerNickname
          ? _value.questionerNickname
          : questionerNickname // ignore: cast_nullable_to_non_nullable
              as String,
      questionerImageUrl: freezed == questionerImageUrl
          ? _value.questionerImageUrl
          : questionerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionUiModelCopyWith<$Res>
    implements $QuestionUiModelCopyWith<$Res> {
  factory _$$_QuestionUiModelCopyWith(
          _$_QuestionUiModel value, $Res Function(_$_QuestionUiModel) then) =
      __$$_QuestionUiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String subjectName,
      String? questionImageUrl,
      bool isResolved,
      String questionerId,
      String questionerNickname,
      String? questionerImageUrl,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_QuestionUiModelCopyWithImpl<$Res>
    extends _$QuestionUiModelCopyWithImpl<$Res, _$_QuestionUiModel>
    implements _$$_QuestionUiModelCopyWith<$Res> {
  __$$_QuestionUiModelCopyWithImpl(
      _$_QuestionUiModel _value, $Res Function(_$_QuestionUiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? subjectName = null,
    Object? questionImageUrl = freezed,
    Object? isResolved = null,
    Object? questionerId = null,
    Object? questionerNickname = null,
    Object? questionerImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_QuestionUiModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      questionImageUrl: freezed == questionImageUrl
          ? _value.questionImageUrl
          : questionImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      questionerId: null == questionerId
          ? _value.questionerId
          : questionerId // ignore: cast_nullable_to_non_nullable
              as String,
      questionerNickname: null == questionerNickname
          ? _value.questionerNickname
          : questionerNickname // ignore: cast_nullable_to_non_nullable
              as String,
      questionerImageUrl: freezed == questionerImageUrl
          ? _value.questionerImageUrl
          : questionerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_QuestionUiModel implements _QuestionUiModel {
  const _$_QuestionUiModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.subjectName,
      this.questionImageUrl,
      required this.isResolved,
      required this.questionerId,
      required this.questionerNickname,
      this.questionerImageUrl,
      required this.createdAt,
      required this.updatedAt});

//質問
  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String subjectName;
  @override
  final String? questionImageUrl;
  @override
  final bool isResolved;
//質問者
  @override
  final String questionerId;
  @override
  final String questionerNickname;
  @override
  final String? questionerImageUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'QuestionUiModel(id: $id, title: $title, content: $content, subjectName: $subjectName, questionImageUrl: $questionImageUrl, isResolved: $isResolved, questionerId: $questionerId, questionerNickname: $questionerNickname, questionerImageUrl: $questionerImageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionUiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.questionImageUrl, questionImageUrl) ||
                other.questionImageUrl == questionImageUrl) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.questionerId, questionerId) ||
                other.questionerId == questionerId) &&
            (identical(other.questionerNickname, questionerNickname) ||
                other.questionerNickname == questionerNickname) &&
            (identical(other.questionerImageUrl, questionerImageUrl) ||
                other.questionerImageUrl == questionerImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      subjectName,
      questionImageUrl,
      isResolved,
      questionerId,
      questionerNickname,
      questionerImageUrl,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionUiModelCopyWith<_$_QuestionUiModel> get copyWith =>
      __$$_QuestionUiModelCopyWithImpl<_$_QuestionUiModel>(this, _$identity);
}

abstract class _QuestionUiModel implements QuestionUiModel {
  const factory _QuestionUiModel(
      {required final String id,
      required final String title,
      required final String content,
      required final String subjectName,
      final String? questionImageUrl,
      required final bool isResolved,
      required final String questionerId,
      required final String questionerNickname,
      final String? questionerImageUrl,
      required final DateTime createdAt,
      required final DateTime? updatedAt}) = _$_QuestionUiModel;

  @override //質問
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get subjectName;
  @override
  String? get questionImageUrl;
  @override
  bool get isResolved;
  @override //質問者
  String get questionerId;
  @override
  String get questionerNickname;
  @override
  String? get questionerImageUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionUiModelCopyWith<_$_QuestionUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
