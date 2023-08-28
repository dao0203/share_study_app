// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answerer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Answerer {
  String get id => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get grade => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswererCopyWith<Answerer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswererCopyWith<$Res> {
  factory $AnswererCopyWith(Answerer value, $Res Function(Answerer) then) =
      _$AnswererCopyWithImpl<$Res, Answerer>;
  @useResult
  $Res call(
      {String id,
      String lastName,
      String firstName,
      String grade,
      String imageUrl});
}

/// @nodoc
class _$AnswererCopyWithImpl<$Res, $Val extends Answerer>
    implements $AnswererCopyWith<$Res> {
  _$AnswererCopyWithImpl(this._value, this._then);

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
abstract class _$$_AnswererCopyWith<$Res> implements $AnswererCopyWith<$Res> {
  factory _$$_AnswererCopyWith(
          _$_Answerer value, $Res Function(_$_Answerer) then) =
      __$$_AnswererCopyWithImpl<$Res>;
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
class __$$_AnswererCopyWithImpl<$Res>
    extends _$AnswererCopyWithImpl<$Res, _$_Answerer>
    implements _$$_AnswererCopyWith<$Res> {
  __$$_AnswererCopyWithImpl(
      _$_Answerer _value, $Res Function(_$_Answerer) _then)
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
    return _then(_$_Answerer(
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

class _$_Answerer implements _Answerer {
  const _$_Answerer(
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
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String grade;
  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString() {
    return 'Answerer(id: $id, lastName: $lastName, firstName: $firstName, grade: $grade, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answerer &&
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
  _$$_AnswererCopyWith<_$_Answerer> get copyWith =>
      __$$_AnswererCopyWithImpl<_$_Answerer>(this, _$identity);
}

abstract class _Answerer implements Answerer {
  const factory _Answerer(
      {final String id,
      final String lastName,
      final String firstName,
      final String grade,
      final String imageUrl}) = _$_Answerer;

  @override
  String get id;
  @override
  String get lastName;
  @override
  String get firstName;
  @override
  String get grade;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AnswererCopyWith<_$_Answerer> get copyWith =>
      throw _privateConstructorUsedError;
}
