// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActivityProfile {
  Profile get profile => throw _privateConstructorUsedError;
  int get questionCount => throw _privateConstructorUsedError;
  int get answerCount => throw _privateConstructorUsedError;
  int get bestAnswerCount => throw _privateConstructorUsedError;
  bool get isMyProfile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActivityProfileCopyWith<ActivityProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityProfileCopyWith<$Res> {
  factory $ActivityProfileCopyWith(
          ActivityProfile value, $Res Function(ActivityProfile) then) =
      _$ActivityProfileCopyWithImpl<$Res, ActivityProfile>;
  @useResult
  $Res call(
      {Profile profile,
      int questionCount,
      int answerCount,
      int bestAnswerCount,
      bool isMyProfile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ActivityProfileCopyWithImpl<$Res, $Val extends ActivityProfile>
    implements $ActivityProfileCopyWith<$Res> {
  _$ActivityProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? questionCount = null,
    Object? answerCount = null,
    Object? bestAnswerCount = null,
    Object? isMyProfile = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerCount: null == answerCount
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int,
      bestAnswerCount: null == bestAnswerCount
          ? _value.bestAnswerCount
          : bestAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMyProfile: null == isMyProfile
          ? _value.isMyProfile
          : isMyProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityProfileImplCopyWith<$Res>
    implements $ActivityProfileCopyWith<$Res> {
  factory _$$ActivityProfileImplCopyWith(_$ActivityProfileImpl value,
          $Res Function(_$ActivityProfileImpl) then) =
      __$$ActivityProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Profile profile,
      int questionCount,
      int answerCount,
      int bestAnswerCount,
      bool isMyProfile});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ActivityProfileImplCopyWithImpl<$Res>
    extends _$ActivityProfileCopyWithImpl<$Res, _$ActivityProfileImpl>
    implements _$$ActivityProfileImplCopyWith<$Res> {
  __$$ActivityProfileImplCopyWithImpl(
      _$ActivityProfileImpl _value, $Res Function(_$ActivityProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? questionCount = null,
    Object? answerCount = null,
    Object? bestAnswerCount = null,
    Object? isMyProfile = null,
  }) {
    return _then(_$ActivityProfileImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerCount: null == answerCount
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int,
      bestAnswerCount: null == bestAnswerCount
          ? _value.bestAnswerCount
          : bestAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMyProfile: null == isMyProfile
          ? _value.isMyProfile
          : isMyProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ActivityProfileImpl implements _ActivityProfile {
  const _$ActivityProfileImpl(
      {required this.profile,
      required this.questionCount,
      required this.answerCount,
      required this.bestAnswerCount,
      required this.isMyProfile});

  @override
  final Profile profile;
  @override
  final int questionCount;
  @override
  final int answerCount;
  @override
  final int bestAnswerCount;
  @override
  final bool isMyProfile;

  @override
  String toString() {
    return 'ActivityProfile(profile: $profile, questionCount: $questionCount, answerCount: $answerCount, bestAnswerCount: $bestAnswerCount, isMyProfile: $isMyProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityProfileImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.answerCount, answerCount) ||
                other.answerCount == answerCount) &&
            (identical(other.bestAnswerCount, bestAnswerCount) ||
                other.bestAnswerCount == bestAnswerCount) &&
            (identical(other.isMyProfile, isMyProfile) ||
                other.isMyProfile == isMyProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, questionCount,
      answerCount, bestAnswerCount, isMyProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityProfileImplCopyWith<_$ActivityProfileImpl> get copyWith =>
      __$$ActivityProfileImplCopyWithImpl<_$ActivityProfileImpl>(
          this, _$identity);
}

abstract class _ActivityProfile implements ActivityProfile {
  const factory _ActivityProfile(
      {required final Profile profile,
      required final int questionCount,
      required final int answerCount,
      required final int bestAnswerCount,
      required final bool isMyProfile}) = _$ActivityProfileImpl;

  @override
  Profile get profile;
  @override
  int get questionCount;
  @override
  int get answerCount;
  @override
  int get bestAnswerCount;
  @override
  bool get isMyProfile;
  @override
  @JsonKey(ignore: true)
  _$$ActivityProfileImplCopyWith<_$ActivityProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
