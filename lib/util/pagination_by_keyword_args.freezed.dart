// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_by_keyword_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationByKeywordArgs {
  String get keyword => throw _privateConstructorUsedError;
  int get offsetAmount => throw _privateConstructorUsedError;
  int get limitAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationByKeywordArgsCopyWith<PaginationByKeywordArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationByKeywordArgsCopyWith<$Res> {
  factory $PaginationByKeywordArgsCopyWith(PaginationByKeywordArgs value,
          $Res Function(PaginationByKeywordArgs) then) =
      _$PaginationByKeywordArgsCopyWithImpl<$Res, PaginationByKeywordArgs>;
  @useResult
  $Res call({String keyword, int offsetAmount, int limitAmount});
}

/// @nodoc
class _$PaginationByKeywordArgsCopyWithImpl<$Res,
        $Val extends PaginationByKeywordArgs>
    implements $PaginationByKeywordArgsCopyWith<$Res> {
  _$PaginationByKeywordArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? offsetAmount = null,
    Object? limitAmount = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      offsetAmount: null == offsetAmount
          ? _value.offsetAmount
          : offsetAmount // ignore: cast_nullable_to_non_nullable
              as int,
      limitAmount: null == limitAmount
          ? _value.limitAmount
          : limitAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationByKeywordArgsImplCopyWith<$Res>
    implements $PaginationByKeywordArgsCopyWith<$Res> {
  factory _$$PaginationByKeywordArgsImplCopyWith(
          _$PaginationByKeywordArgsImpl value,
          $Res Function(_$PaginationByKeywordArgsImpl) then) =
      __$$PaginationByKeywordArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String keyword, int offsetAmount, int limitAmount});
}

/// @nodoc
class __$$PaginationByKeywordArgsImplCopyWithImpl<$Res>
    extends _$PaginationByKeywordArgsCopyWithImpl<$Res,
        _$PaginationByKeywordArgsImpl>
    implements _$$PaginationByKeywordArgsImplCopyWith<$Res> {
  __$$PaginationByKeywordArgsImplCopyWithImpl(
      _$PaginationByKeywordArgsImpl _value,
      $Res Function(_$PaginationByKeywordArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? offsetAmount = null,
    Object? limitAmount = null,
  }) {
    return _then(_$PaginationByKeywordArgsImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      offsetAmount: null == offsetAmount
          ? _value.offsetAmount
          : offsetAmount // ignore: cast_nullable_to_non_nullable
              as int,
      limitAmount: null == limitAmount
          ? _value.limitAmount
          : limitAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaginationByKeywordArgsImpl implements _PaginationByKeywordArgs {
  const _$PaginationByKeywordArgsImpl(
      {required this.keyword,
      required this.offsetAmount,
      required this.limitAmount});

  @override
  final String keyword;
  @override
  final int offsetAmount;
  @override
  final int limitAmount;

  @override
  String toString() {
    return 'PaginationByKeywordArgs(keyword: $keyword, offsetAmount: $offsetAmount, limitAmount: $limitAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationByKeywordArgsImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.offsetAmount, offsetAmount) ||
                other.offsetAmount == offsetAmount) &&
            (identical(other.limitAmount, limitAmount) ||
                other.limitAmount == limitAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, keyword, offsetAmount, limitAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationByKeywordArgsImplCopyWith<_$PaginationByKeywordArgsImpl>
      get copyWith => __$$PaginationByKeywordArgsImplCopyWithImpl<
          _$PaginationByKeywordArgsImpl>(this, _$identity);
}

abstract class _PaginationByKeywordArgs implements PaginationByKeywordArgs {
  const factory _PaginationByKeywordArgs(
      {required final String keyword,
      required final int offsetAmount,
      required final int limitAmount}) = _$PaginationByKeywordArgsImpl;

  @override
  String get keyword;
  @override
  int get offsetAmount;
  @override
  int get limitAmount;
  @override
  @JsonKey(ignore: true)
  _$$PaginationByKeywordArgsImplCopyWith<_$PaginationByKeywordArgsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
