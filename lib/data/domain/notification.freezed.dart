// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Notification {
  String get id => throw _privateConstructorUsedError;
  Profile? get sender => throw _privateConstructorUsedError;
  String? get questionId => throw _privateConstructorUsedError;
  String? get answerContent => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String id,
      Profile? sender,
      String? questionId,
      String? answerContent,
      NotificationType type,
      DateTime createdAt});

  $ProfileCopyWith<$Res>? get sender;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sender = freezed,
    Object? questionId = freezed,
    Object? answerContent = freezed,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Profile?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answerContent: freezed == answerContent
          ? _value.answerContent
          : answerContent // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get sender {
    if (_value.sender == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.sender!, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Profile? sender,
      String? questionId,
      String? answerContent,
      NotificationType type,
      DateTime createdAt});

  @override
  $ProfileCopyWith<$Res>? get sender;
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sender = freezed,
    Object? questionId = freezed,
    Object? answerContent = freezed,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Profile?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answerContent: freezed == answerContent
          ? _value.answerContent
          : answerContent // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.id,
      required this.sender,
      this.questionId,
      this.answerContent,
      required this.type,
      required this.createdAt});

  @override
  final String id;
  @override
  final Profile? sender;
  @override
  final String? questionId;
  @override
  final String? answerContent;
  @override
  final NotificationType type;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Notification(id: $id, sender: $sender, questionId: $questionId, answerContent: $answerContent, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerContent, answerContent) ||
                other.answerContent == answerContent) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, sender, questionId, answerContent, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required final String id,
      required final Profile? sender,
      final String? questionId,
      final String? answerContent,
      required final NotificationType type,
      required final DateTime createdAt}) = _$NotificationImpl;

  @override
  String get id;
  @override
  Profile? get sender;
  @override
  String? get questionId;
  @override
  String? get answerContent;
  @override
  NotificationType get type;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
