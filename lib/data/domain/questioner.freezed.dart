// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questioner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Questioner {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionerCopyWith<Questioner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionerCopyWith<$Res> {
  factory $QuestionerCopyWith(
          Questioner value, $Res Function(Questioner) then) =
      _$QuestionerCopyWithImpl<$Res, Questioner>;
  @useResult
  $Res call({String id, String nickname, String? imageUrl});
}

/// @nodoc
class _$QuestionerCopyWithImpl<$Res, $Val extends Questioner>
    implements $QuestionerCopyWith<$Res> {
  _$QuestionerCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionerCopyWith<$Res>
    implements $QuestionerCopyWith<$Res> {
  factory _$$_QuestionerCopyWith(
          _$_Questioner value, $Res Function(_$_Questioner) then) =
      __$$_QuestionerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nickname, String? imageUrl});
}

/// @nodoc
class __$$_QuestionerCopyWithImpl<$Res>
    extends _$QuestionerCopyWithImpl<$Res, _$_Questioner>
    implements _$$_QuestionerCopyWith<$Res> {
  __$$_QuestionerCopyWithImpl(
      _$_Questioner _value, $Res Function(_$_Questioner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Questioner(
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
    ));
  }
}

/// @nodoc

class _$_Questioner implements _Questioner {
  const _$_Questioner({this.id = "", this.nickname = "", this.imageUrl});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String nickname;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Questioner(id: $id, nickname: $nickname, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questioner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionerCopyWith<_$_Questioner> get copyWith =>
      __$$_QuestionerCopyWithImpl<_$_Questioner>(this, _$identity);
}

abstract class _Questioner implements Questioner {
  const factory _Questioner(
      {final String id,
      final String nickname,
      final String? imageUrl}) = _$_Questioner;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionerCopyWith<_$_Questioner> get copyWith =>
      throw _privateConstructorUsedError;
}
