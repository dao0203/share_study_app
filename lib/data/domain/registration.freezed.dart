// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Registration {
  String get email => throw _privateConstructorUsedError; //メールアドレス
  String get firstName => throw _privateConstructorUsedError; //名
  String get lastName => throw _privateConstructorUsedError; //姓
  String get password => throw _privateConstructorUsedError; //パスワード
  String get grade => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationCopyWith<Registration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationCopyWith<$Res> {
  factory $RegistrationCopyWith(
          Registration value, $Res Function(Registration) then) =
      _$RegistrationCopyWithImpl<$Res, Registration>;
  @useResult
  $Res call(
      {String email,
      String firstName,
      String lastName,
      String password,
      String grade});
}

/// @nodoc
class _$RegistrationCopyWithImpl<$Res, $Val extends Registration>
    implements $RegistrationCopyWith<$Res> {
  _$RegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? grade = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegistrationCopyWith<$Res>
    implements $RegistrationCopyWith<$Res> {
  factory _$$_RegistrationCopyWith(
          _$_Registration value, $Res Function(_$_Registration) then) =
      __$$_RegistrationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String firstName,
      String lastName,
      String password,
      String grade});
}

/// @nodoc
class __$$_RegistrationCopyWithImpl<$Res>
    extends _$RegistrationCopyWithImpl<$Res, _$_Registration>
    implements _$$_RegistrationCopyWith<$Res> {
  __$$_RegistrationCopyWithImpl(
      _$_Registration _value, $Res Function(_$_Registration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? grade = null,
  }) {
    return _then(_$_Registration(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Registration implements _Registration {
  const _$_Registration(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.grade});

  @override
  final String email;
//メールアドレス
  @override
  final String firstName;
//名
  @override
  final String lastName;
//姓
  @override
  final String password;
//パスワード
  @override
  final String grade;

  @override
  String toString() {
    return 'Registration(email: $email, firstName: $firstName, lastName: $lastName, password: $password, grade: $grade)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Registration &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.grade, grade) || other.grade == grade));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, firstName, lastName, password, grade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationCopyWith<_$_Registration> get copyWith =>
      __$$_RegistrationCopyWithImpl<_$_Registration>(this, _$identity);
}

abstract class _Registration implements Registration {
  const factory _Registration(
      {required final String email,
      required final String firstName,
      required final String lastName,
      required final String password,
      required final String grade}) = _$_Registration;

  @override
  String get email;
  @override //メールアドレス
  String get firstName;
  @override //名
  String get lastName;
  @override //姓
  String get password;
  @override //パスワード
  String get grade;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationCopyWith<_$_Registration> get copyWith =>
      throw _privateConstructorUsedError;
}
