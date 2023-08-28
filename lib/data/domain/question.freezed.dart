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
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get qSubName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;
  Questioner get questioner => throw _privateConstructorUsedError;
  Subject get subject => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {String id,
      String title,
      String qSubName,
      String content,
      String imageUrl,
      bool isResolved,
      Questioner questioner,
      Subject subject,
      DateTime? createdAt,
      DateTime? updatedAt});

  $QuestionerCopyWith<$Res> get questioner;
  $SubjectCopyWith<$Res> get subject;
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
    Object? id = null,
    Object? title = null,
    Object? qSubName = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? isResolved = null,
    Object? questioner = null,
    Object? subject = null,
    Object? createdAt = freezed,
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
      qSubName: null == qSubName
          ? _value.qSubName
          : qSubName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      questioner: null == questioner
          ? _value.questioner
          : questioner // ignore: cast_nullable_to_non_nullable
              as Questioner,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionerCopyWith<$Res> get questioner {
    return $QuestionerCopyWith<$Res>(_value.questioner, (value) {
      return _then(_value.copyWith(questioner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res> get subject {
    return $SubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
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
      {String id,
      String title,
      String qSubName,
      String content,
      String imageUrl,
      bool isResolved,
      Questioner questioner,
      Subject subject,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $QuestionerCopyWith<$Res> get questioner;
  @override
  $SubjectCopyWith<$Res> get subject;
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
    Object? id = null,
    Object? title = null,
    Object? qSubName = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? isResolved = null,
    Object? questioner = null,
    Object? subject = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      qSubName: null == qSubName
          ? _value.qSubName
          : qSubName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      questioner: null == questioner
          ? _value.questioner
          : questioner // ignore: cast_nullable_to_non_nullable
              as Questioner,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Question implements _Question {
  const _$_Question(
      {this.id = "",
      this.title = "",
      this.qSubName = "",
      this.content = "",
      this.imageUrl = "",
      this.isResolved = false,
      this.questioner = const Questioner(),
      this.subject = const Subject(),
      this.createdAt,
      this.updatedAt});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String qSubName;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final bool isResolved;
  @override
  @JsonKey()
  final Questioner questioner;
  @override
  @JsonKey()
  final Subject subject;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Question(id: $id, title: $title, qSubName: $qSubName, content: $content, imageUrl: $imageUrl, isResolved: $isResolved, questioner: $questioner, subject: $subject, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.qSubName, qSubName) ||
                other.qSubName == qSubName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.questioner, questioner) ||
                other.questioner == questioner) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, qSubName, content,
      imageUrl, isResolved, questioner, subject, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);
}

abstract class _Question implements Question {
  const factory _Question(
      {final String id,
      final String title,
      final String qSubName,
      final String content,
      final String imageUrl,
      final bool isResolved,
      final Questioner questioner,
      final Subject subject,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_Question;

  @override
  String get id;
  @override
  String get title;
  @override
  String get qSubName;
  @override
  String get content;
  @override
  String get imageUrl;
  @override
  bool get isResolved;
  @override
  Questioner get questioner;
  @override
  Subject get subject;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
