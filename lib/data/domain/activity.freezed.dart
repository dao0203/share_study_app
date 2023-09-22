// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Activity {
  String get id => throw _privateConstructorUsedError;
  int get questionCount => throw _privateConstructorUsedError;
  int get answerCount => throw _privateConstructorUsedError;
  int get bestAnswerCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {String id, int questionCount, int answerCount, int bestAnswerCount});
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionCount = null,
    Object? answerCount = null,
    Object? bestAnswerCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$$_ActivityCopyWith(
          _$_Activity value, $Res Function(_$_Activity) then) =
      __$$_ActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, int questionCount, int answerCount, int bestAnswerCount});
}

/// @nodoc
class __$$_ActivityCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$_Activity>
    implements _$$_ActivityCopyWith<$Res> {
  __$$_ActivityCopyWithImpl(
      _$_Activity _value, $Res Function(_$_Activity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionCount = null,
    Object? answerCount = null,
    Object? bestAnswerCount = null,
  }) {
    return _then(_$_Activity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

class _$_Activity implements _Activity {
  _$_Activity(
      {required this.id,
      required this.questionCount,
      required this.answerCount,
      required this.bestAnswerCount});

  @override
  final String id;
  @override
  final int questionCount;
  @override
  final int answerCount;
  @override
  final int bestAnswerCount;

  @override
  String toString() {
    return 'Activity(id: $id, questionCount: $questionCount, answerCount: $answerCount, bestAnswerCount: $bestAnswerCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Activity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.answerCount, answerCount) ||
                other.answerCount == answerCount) &&
            (identical(other.bestAnswerCount, bestAnswerCount) ||
                other.bestAnswerCount == bestAnswerCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, questionCount, answerCount, bestAnswerCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActivityCopyWith<_$_Activity> get copyWith =>
      __$$_ActivityCopyWithImpl<_$_Activity>(this, _$identity);
}

abstract class _Activity implements Activity {
  factory _Activity(
      {required final String id,
      required final int questionCount,
      required final int answerCount,
      required final int bestAnswerCount}) = _$_Activity;

  @override
  String get id;
  @override
  int get questionCount;
  @override
  int get answerCount;
  @override
  int get bestAnswerCount;
  @override
  @JsonKey(ignore: true)
  _$$_ActivityCopyWith<_$_Activity> get copyWith =>
      throw _privateConstructorUsedError;
}
