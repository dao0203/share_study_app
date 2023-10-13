// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_by_profile_id_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationByProfileIdArgs {
  String get profileId => throw _privateConstructorUsedError;
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationByProfileIdArgsCopyWith<PaginationByProfileIdArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationByProfileIdArgsCopyWith<$Res> {
  factory $PaginationByProfileIdArgsCopyWith(PaginationByProfileIdArgs value,
          $Res Function(PaginationByProfileIdArgs) then) =
      _$PaginationByProfileIdArgsCopyWithImpl<$Res, PaginationByProfileIdArgs>;
  @useResult
  $Res call({String profileId, int start, int end});
}

/// @nodoc
class _$PaginationByProfileIdArgsCopyWithImpl<$Res,
        $Val extends PaginationByProfileIdArgs>
    implements $PaginationByProfileIdArgsCopyWith<$Res> {
  _$PaginationByProfileIdArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$PaginationByProfileIdArgsImplCopyWith<$Res>
    implements $PaginationByProfileIdArgsCopyWith<$Res> {
  factory _$$PaginationByProfileIdArgsImplCopyWith(
          _$PaginationByProfileIdArgsImpl value,
          $Res Function(_$PaginationByProfileIdArgsImpl) then) =
      __$$PaginationByProfileIdArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profileId, int start, int end});
}

/// @nodoc
class __$$PaginationByProfileIdArgsImplCopyWithImpl<$Res>
    extends _$PaginationByProfileIdArgsCopyWithImpl<$Res,
        _$PaginationByProfileIdArgsImpl>
    implements _$$PaginationByProfileIdArgsImplCopyWith<$Res> {
  __$$PaginationByProfileIdArgsImplCopyWithImpl(
      _$PaginationByProfileIdArgsImpl _value,
      $Res Function(_$PaginationByProfileIdArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$PaginationByProfileIdArgsImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$PaginationByProfileIdArgsImpl implements _PaginationByProfileIdArgs {
  const _$PaginationByProfileIdArgsImpl(
      {required this.profileId, required this.start, required this.end});

  @override
  final String profileId;
  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'PaginationByProfileIdArgs(profileId: $profileId, start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationByProfileIdArgsImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationByProfileIdArgsImplCopyWith<_$PaginationByProfileIdArgsImpl>
      get copyWith => __$$PaginationByProfileIdArgsImplCopyWithImpl<
          _$PaginationByProfileIdArgsImpl>(this, _$identity);
}

abstract class _PaginationByProfileIdArgs implements PaginationByProfileIdArgs {
  const factory _PaginationByProfileIdArgs(
      {required final String profileId,
      required final int start,
      required final int end}) = _$PaginationByProfileIdArgsImpl;

  @override
  String get profileId;
  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$PaginationByProfileIdArgsImplCopyWith<_$PaginationByProfileIdArgsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
