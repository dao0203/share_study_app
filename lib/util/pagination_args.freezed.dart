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
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

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
  $Res call({int start, int end});
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
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationArgsCopyWith<$Res>
    implements $PaginationArgsCopyWith<$Res> {
  factory _$$_PaginationArgsCopyWith(
          _$_PaginationArgs value, $Res Function(_$_PaginationArgs) then) =
      __$$_PaginationArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int end});
}

/// @nodoc
class __$$_PaginationArgsCopyWithImpl<$Res>
    extends _$PaginationArgsCopyWithImpl<$Res, _$_PaginationArgs>
    implements _$$_PaginationArgsCopyWith<$Res> {
  __$$_PaginationArgsCopyWithImpl(
      _$_PaginationArgs _value, $Res Function(_$_PaginationArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_PaginationArgs(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PaginationArgs implements _PaginationArgs {
  const _$_PaginationArgs({required this.start, required this.end});

  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'PaginationArgs(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationArgs &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationArgsCopyWith<_$_PaginationArgs> get copyWith =>
      __$$_PaginationArgsCopyWithImpl<_$_PaginationArgs>(this, _$identity);
}

abstract class _PaginationArgs implements PaginationArgs {
  const factory _PaginationArgs(
      {required final int start, required final int end}) = _$_PaginationArgs;

  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationArgsCopyWith<_$_PaginationArgs> get copyWith =>
      throw _privateConstructorUsedError;
}
