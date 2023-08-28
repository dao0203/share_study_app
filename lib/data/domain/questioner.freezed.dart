// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questioner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Questioner {
  String get id => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError; //姓
  String get firstName => throw _privateConstructorUsedError; //名
  String get grade => throw _privateConstructorUsedError; //学年
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionerCopyWith<Questioner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionerCopyWith<$Res> {
  factory $QuestionerCopyWith(
          Questioner value, $Res Function(Questioner) then) =
      _$QuestionerCopyWithImpl<$Res, Questioner>;
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String grade,
      String imageUrl});
}

/// @nodoc
class _$QuestionerCopyWithImpl<$Res, $Val extends Questioner>
    implements $QuestionerCopyWith<$Res> {
  _$QuestionerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? grade = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionerCopyWith<$Res>
    implements $QuestionerCopyWith<$Res> {
  factory _$$_QuestionerCopyWith(
          _$_Questioner value, $Res Function(_$_Questioner) then) =
      __$$_QuestionerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String grade,
      String imageUrl});
}

/// @nodoc
class __$$_QuestionerCopyWithImpl<$Res>
    extends _$QuestionerCopyWithImpl<$Res, _$_Questioner>
    implements _$$_QuestionerCopyWith<$Res> {
  __$$_QuestionerCopyWithImpl(
      _$_Questioner _value, $Res Function(_$_Questioner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? grade = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_Questioner(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Questioner implements _Questioner {
  const _$_Questioner(
      {this.id = "",
      this.lastName = "",
      this.firstName = "",
      this.grade = "",
      this.imageUrl = ""});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String lastName;
//姓
  @override
  @JsonKey()
  final String firstName;
//名
  @override
  @JsonKey()
  final String grade;
//学年
  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString() {
    return 'Questioner(id: $id, lastName: $lastName, firstName: $firstName, grade: $grade, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questioner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, lastName, firstName, grade, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionerCopyWith<_$_Questioner> get copyWith =>
      __$$_QuestionerCopyWithImpl<_$_Questioner>(this, _$identity);
}

abstract class _Questioner implements Questioner {
  const factory _Questioner(
      {final String id,
      final String lastName,
      final String firstName,
      final String grade,
      final String imageUrl}) = _$_Questioner;

  @override
  String get id;
  @override
  String get lastName;
  @override //姓
  String get firstName;
  @override //名
  String get grade;
  @override //学年
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionerCopyWith<_$_Questioner> get copyWith =>
      throw _privateConstructorUsedError;
}
