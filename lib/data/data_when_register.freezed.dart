// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_when_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataWhenRegister {
  String get googleAccountId =>
      throw _privateConstructorUsedError; //グーグルアカウントID
  String get firstName => throw _privateConstructorUsedError; //名
  String get lastName => throw _privateConstructorUsedError; //姓
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataWhenRegisterCopyWith<DataWhenRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataWhenRegisterCopyWith<$Res> {
  factory $DataWhenRegisterCopyWith(
          DataWhenRegister value, $Res Function(DataWhenRegister) then) =
      _$DataWhenRegisterCopyWithImpl<$Res, DataWhenRegister>;
  @useResult
  $Res call(
      {String googleAccountId,
      String firstName,
      String lastName,
      String email});
}

/// @nodoc
class _$DataWhenRegisterCopyWithImpl<$Res, $Val extends DataWhenRegister>
    implements $DataWhenRegisterCopyWith<$Res> {
  _$DataWhenRegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleAccountId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      googleAccountId: null == googleAccountId
          ? _value.googleAccountId
          : googleAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataWhenRegisterCopyWith<$Res>
    implements $DataWhenRegisterCopyWith<$Res> {
  factory _$$_DataWhenRegisterCopyWith(
          _$_DataWhenRegister value, $Res Function(_$_DataWhenRegister) then) =
      __$$_DataWhenRegisterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String googleAccountId,
      String firstName,
      String lastName,
      String email});
}

/// @nodoc
class __$$_DataWhenRegisterCopyWithImpl<$Res>
    extends _$DataWhenRegisterCopyWithImpl<$Res, _$_DataWhenRegister>
    implements _$$_DataWhenRegisterCopyWith<$Res> {
  __$$_DataWhenRegisterCopyWithImpl(
      _$_DataWhenRegister _value, $Res Function(_$_DataWhenRegister) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleAccountId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(_$_DataWhenRegister(
      googleAccountId: null == googleAccountId
          ? _value.googleAccountId
          : googleAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DataWhenRegister implements _DataWhenRegister {
  const _$_DataWhenRegister(
      {required this.googleAccountId,
      required this.firstName,
      required this.lastName,
      required this.email});

  @override
  final String googleAccountId;
//グーグルアカウントID
  @override
  final String firstName;
//名
  @override
  final String lastName;
//姓
  @override
  final String email;

  @override
  String toString() {
    return 'DataWhenRegister(googleAccountId: $googleAccountId, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataWhenRegister &&
            (identical(other.googleAccountId, googleAccountId) ||
                other.googleAccountId == googleAccountId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, googleAccountId, firstName, lastName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataWhenRegisterCopyWith<_$_DataWhenRegister> get copyWith =>
      __$$_DataWhenRegisterCopyWithImpl<_$_DataWhenRegister>(this, _$identity);
}

abstract class _DataWhenRegister implements DataWhenRegister {
  const factory _DataWhenRegister(
      {required final String googleAccountId,
      required final String firstName,
      required final String lastName,
      required final String email}) = _$_DataWhenRegister;

  @override
  String get googleAccountId;
  @override //グーグルアカウントID
  String get firstName;
  @override //名
  String get lastName;
  @override //姓
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_DataWhenRegisterCopyWith<_$_DataWhenRegister> get copyWith =>
      throw _privateConstructorUsedError;
}
