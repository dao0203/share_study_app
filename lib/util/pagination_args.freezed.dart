// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationArgs {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationArgsCopyWith<PaginationArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationArgsCopyWith<$Res> {
  factory $PaginationArgsCopyWith(
          PaginationArgs value, $Res Function(PaginationArgs) then) =
      _$PaginationArgsCopyWithImpl<$Res, PaginationArgs>;
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class _$PaginationArgsCopyWithImpl<$Res, $Val extends PaginationArgs>
    implements $PaginationArgsCopyWith<$Res> {
  _$PaginationArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationArgsImplCopyWith<$Res>
    implements $PaginationArgsCopyWith<$Res> {
  factory _$$PaginationArgsImplCopyWith(_$PaginationArgsImpl value,
          $Res Function(_$PaginationArgsImpl) then) =
      __$$PaginationArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class __$$PaginationArgsImplCopyWithImpl<$Res>
    extends _$PaginationArgsCopyWithImpl<$Res, _$PaginationArgsImpl>
    implements _$$PaginationArgsImplCopyWith<$Res> {
  __$$PaginationArgsImplCopyWithImpl(
      _$PaginationArgsImpl _value, $Res Function(_$PaginationArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$PaginationArgsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaginationArgsImpl implements _PaginationArgs {
  const _$PaginationArgsImpl({required this.limit, required this.offset});

  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'PaginationArgs(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationArgsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationArgsImplCopyWith<_$PaginationArgsImpl> get copyWith =>
      __$$PaginationArgsImplCopyWithImpl<_$PaginationArgsImpl>(
          this, _$identity);
}

abstract class _PaginationArgs implements PaginationArgs {
  const factory _PaginationArgs(
      {required final int limit,
      required final int offset}) = _$PaginationArgsImpl;

  @override
  int get limit;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$PaginationArgsImplCopyWith<_$PaginationArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
