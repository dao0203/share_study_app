// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_use_case_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionUseCaseModel {
  Question get question => throw _privateConstructorUsedError;
  bool get isMyQuestion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionUseCaseModelCopyWith<QuestionUseCaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionUseCaseModelCopyWith<$Res> {
  factory $QuestionUseCaseModelCopyWith(QuestionUseCaseModel value,
          $Res Function(QuestionUseCaseModel) then) =
      _$QuestionUseCaseModelCopyWithImpl<$Res, QuestionUseCaseModel>;
  @useResult
  $Res call({Question question, bool isMyQuestion});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class _$QuestionUseCaseModelCopyWithImpl<$Res,
        $Val extends QuestionUseCaseModel>
    implements $QuestionUseCaseModelCopyWith<$Res> {
  _$QuestionUseCaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? isMyQuestion = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      isMyQuestion: null == isMyQuestion
          ? _value.isMyQuestion
          : isMyQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionUseCaseModelImplCopyWith<$Res>
    implements $QuestionUseCaseModelCopyWith<$Res> {
  factory _$$QuestionUseCaseModelImplCopyWith(_$QuestionUseCaseModelImpl value,
          $Res Function(_$QuestionUseCaseModelImpl) then) =
      __$$QuestionUseCaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Question question, bool isMyQuestion});

  @override
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$QuestionUseCaseModelImplCopyWithImpl<$Res>
    extends _$QuestionUseCaseModelCopyWithImpl<$Res, _$QuestionUseCaseModelImpl>
    implements _$$QuestionUseCaseModelImplCopyWith<$Res> {
  __$$QuestionUseCaseModelImplCopyWithImpl(_$QuestionUseCaseModelImpl _value,
      $Res Function(_$QuestionUseCaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? isMyQuestion = null,
  }) {
    return _then(_$QuestionUseCaseModelImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      isMyQuestion: null == isMyQuestion
          ? _value.isMyQuestion
          : isMyQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuestionUseCaseModelImpl implements _QuestionUseCaseModel {
  const _$QuestionUseCaseModelImpl(
      {required this.question, required this.isMyQuestion});

  @override
  final Question question;
  @override
  final bool isMyQuestion;

  @override
  String toString() {
    return 'QuestionUseCaseModel(question: $question, isMyQuestion: $isMyQuestion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionUseCaseModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.isMyQuestion, isMyQuestion) ||
                other.isMyQuestion == isMyQuestion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, isMyQuestion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionUseCaseModelImplCopyWith<_$QuestionUseCaseModelImpl>
      get copyWith =>
          __$$QuestionUseCaseModelImplCopyWithImpl<_$QuestionUseCaseModelImpl>(
              this, _$identity);
}

abstract class _QuestionUseCaseModel implements QuestionUseCaseModel {
  const factory _QuestionUseCaseModel(
      {required final Question question,
      required final bool isMyQuestion}) = _$QuestionUseCaseModelImpl;

  @override
  Question get question;
  @override
  bool get isMyQuestion;
  @override
  @JsonKey(ignore: true)
  _$$QuestionUseCaseModelImplCopyWith<_$QuestionUseCaseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
