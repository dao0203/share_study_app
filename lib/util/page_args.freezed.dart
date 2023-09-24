// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PageArgs {
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageArgsCopyWith<PageArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageArgsCopyWith<$Res> {
  factory $PageArgsCopyWith(PageArgs value, $Res Function(PageArgs) then) =
      _$PageArgsCopyWithImpl<$Res, PageArgs>;
  @useResult
  $Res call({int start, int end});
}

/// @nodoc
class _$PageArgsCopyWithImpl<$Res, $Val extends PageArgs>
    implements $PageArgsCopyWith<$Res> {
  _$PageArgsCopyWithImpl(this._value, this._then);

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
abstract class _$$_PageArgsCopyWith<$Res> implements $PageArgsCopyWith<$Res> {
  factory _$$_PageArgsCopyWith(
          _$_PageArgs value, $Res Function(_$_PageArgs) then) =
      __$$_PageArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int end});
}

/// @nodoc
class __$$_PageArgsCopyWithImpl<$Res>
    extends _$PageArgsCopyWithImpl<$Res, _$_PageArgs>
    implements _$$_PageArgsCopyWith<$Res> {
  __$$_PageArgsCopyWithImpl(
      _$_PageArgs _value, $Res Function(_$_PageArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_PageArgs(
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

class _$_PageArgs implements _PageArgs {
  const _$_PageArgs({required this.start, required this.end});

  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'PageArgs(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageArgs &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageArgsCopyWith<_$_PageArgs> get copyWith =>
      __$$_PageArgsCopyWithImpl<_$_PageArgs>(this, _$identity);
}

abstract class _PageArgs implements PageArgs {
  const factory _PageArgs({required final int start, required final int end}) =
      _$_PageArgs;

  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$_PageArgsCopyWith<_$_PageArgs> get copyWith =>
      throw _privateConstructorUsedError;
}
