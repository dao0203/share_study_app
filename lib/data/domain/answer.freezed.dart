// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Answer {
  String get id => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get questionerId => throw _privateConstructorUsedError;
  String? get questionerImageUrl => throw _privateConstructorUsedError;
  String? get questionTitle => throw _privateConstructorUsedError;
  bool get isBestAnswer => throw _privateConstructorUsedError;
  Profile get answerer => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {String id,
      String questionId,
      String content,
      String? imageUrl,
      String? questionerId,
      String? questionerImageUrl,
      String? questionTitle,
      bool isBestAnswer,
      Profile answerer,
      DateTime createdAt,
      DateTime updatedAt});

  $ProfileCopyWith<$Res> get answerer;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? content = null,
    Object? imageUrl = freezed,
    Object? questionerId = freezed,
    Object? questionerImageUrl = freezed,
    Object? questionTitle = freezed,
    Object? isBestAnswer = null,
    Object? answerer = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      questionerId: freezed == questionerId
          ? _value.questionerId
          : questionerId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionerImageUrl: freezed == questionerImageUrl
          ? _value.questionerImageUrl
          : questionerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      questionTitle: freezed == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isBestAnswer: null == isBestAnswer
          ? _value.isBestAnswer
          : isBestAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      answerer: null == answerer
          ? _value.answerer
          : answerer // ignore: cast_nullable_to_non_nullable
              as Profile,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get answerer {
    return $ProfileCopyWith<$Res>(_value.answerer, (value) {
      return _then(_value.copyWith(answerer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String questionId,
      String content,
      String? imageUrl,
      String? questionerId,
      String? questionerImageUrl,
      String? questionTitle,
      bool isBestAnswer,
      Profile answerer,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $ProfileCopyWith<$Res> get answerer;
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? content = null,
    Object? imageUrl = freezed,
    Object? questionerId = freezed,
    Object? questionerImageUrl = freezed,
    Object? questionTitle = freezed,
    Object? isBestAnswer = null,
    Object? answerer = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      questionerId: freezed == questionerId
          ? _value.questionerId
          : questionerId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionerImageUrl: freezed == questionerImageUrl
          ? _value.questionerImageUrl
          : questionerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      questionTitle: freezed == questionTitle
          ? _value.questionTitle
          : questionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isBestAnswer: null == isBestAnswer
          ? _value.isBestAnswer
          : isBestAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      answerer: null == answerer
          ? _value.answerer
          : answerer // ignore: cast_nullable_to_non_nullable
              as Profile,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AnswerImpl implements _Answer {
  const _$AnswerImpl(
      {required this.id,
      required this.questionId,
      required this.content,
      this.imageUrl,
      this.questionerId,
      this.questionerImageUrl,
      this.questionTitle,
      required this.isBestAnswer,
      required this.answerer,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final String questionId;
  @override
  final String content;
  @override
  final String? imageUrl;
  @override
  final String? questionerId;
  @override
  final String? questionerImageUrl;
  @override
  final String? questionTitle;
  @override
  final bool isBestAnswer;
  @override
  final Profile answerer;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Answer(id: $id, questionId: $questionId, content: $content, imageUrl: $imageUrl, questionerId: $questionerId, questionerImageUrl: $questionerImageUrl, questionTitle: $questionTitle, isBestAnswer: $isBestAnswer, answerer: $answerer, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.questionerId, questionerId) ||
                other.questionerId == questionerId) &&
            (identical(other.questionerImageUrl, questionerImageUrl) ||
                other.questionerImageUrl == questionerImageUrl) &&
            (identical(other.questionTitle, questionTitle) ||
                other.questionTitle == questionTitle) &&
            (identical(other.isBestAnswer, isBestAnswer) ||
                other.isBestAnswer == isBestAnswer) &&
            (identical(other.answerer, answerer) ||
                other.answerer == answerer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionId,
      content,
      imageUrl,
      questionerId,
      questionerImageUrl,
      questionTitle,
      isBestAnswer,
      answerer,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {required final String id,
      required final String questionId,
      required final String content,
      final String? imageUrl,
      final String? questionerId,
      final String? questionerImageUrl,
      final String? questionTitle,
      required final bool isBestAnswer,
      required final Profile answerer,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AnswerImpl;

  @override
  String get id;
  @override
  String get questionId;
  @override
  String get content;
  @override
  String? get imageUrl;
  @override
  String? get questionerId;
  @override
  String? get questionerImageUrl;
  @override
  String? get questionTitle;
  @override
  bool get isBestAnswer;
  @override
  Profile get answerer;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
