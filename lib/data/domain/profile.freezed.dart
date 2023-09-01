// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Profile {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get universityName => throw _privateConstructorUsedError;
  String? get facultyName => throw _privateConstructorUsedError;
  String? get departmentName => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String id,
      String nickname,
      String? imageUrl,
      String universityName,
      String? facultyName,
      String? departmentName,
      String? grade,
      String? bio});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? imageUrl = freezed,
    Object? universityName = null,
    Object? facultyName = freezed,
    Object? departmentName = freezed,
    Object? grade = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      universityName: null == universityName
          ? _value.universityName
          : universityName // ignore: cast_nullable_to_non_nullable
              as String,
      facultyName: freezed == facultyName
          ? _value.facultyName
          : facultyName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nickname,
      String? imageUrl,
      String universityName,
      String? facultyName,
      String? departmentName,
      String? grade,
      String? bio});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? imageUrl = freezed,
    Object? universityName = null,
    Object? facultyName = freezed,
    Object? departmentName = freezed,
    Object? grade = freezed,
    Object? bio = freezed,
  }) {
    return _then(_$_Profile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      universityName: null == universityName
          ? _value.universityName
          : universityName // ignore: cast_nullable_to_non_nullable
              as String,
      facultyName: freezed == facultyName
          ? _value.facultyName
          : facultyName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Profile implements _Profile {
  const _$_Profile(
      {this.id = "",
      this.nickname = "",
      this.imageUrl,
      this.universityName = "",
      this.facultyName,
      this.departmentName,
      this.grade,
      this.bio});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String nickname;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final String universityName;
  @override
  final String? facultyName;
  @override
  final String? departmentName;
  @override
  final String? grade;
  @override
  final String? bio;

  @override
  String toString() {
    return 'Profile(id: $id, nickname: $nickname, imageUrl: $imageUrl, universityName: $universityName, facultyName: $facultyName, departmentName: $departmentName, grade: $grade, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.universityName, universityName) ||
                other.universityName == universityName) &&
            (identical(other.facultyName, facultyName) ||
                other.facultyName == facultyName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, imageUrl,
      universityName, facultyName, departmentName, grade, bio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String id,
      final String nickname,
      final String? imageUrl,
      final String universityName,
      final String? facultyName,
      final String? departmentName,
      final String? grade,
      final String? bio}) = _$_Profile;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String? get imageUrl;
  @override
  String get universityName;
  @override
  String? get facultyName;
  @override
  String? get departmentName;
  @override
  String? get grade;
  @override
  String? get bio;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
