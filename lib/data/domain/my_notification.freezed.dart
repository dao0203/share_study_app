// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyNotification {
  Notification get notification => throw _privateConstructorUsedError;
  bool get hasQuestion => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyNotificationCopyWith<MyNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyNotificationCopyWith<$Res> {
  factory $MyNotificationCopyWith(
          MyNotification value, $Res Function(MyNotification) then) =
      _$MyNotificationCopyWithImpl<$Res, MyNotification>;
  @useResult
  $Res call({Notification notification, bool hasQuestion, String message});

  $NotificationCopyWith<$Res> get notification;
}

/// @nodoc
class _$MyNotificationCopyWithImpl<$Res, $Val extends MyNotification>
    implements $MyNotificationCopyWith<$Res> {
  _$MyNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? hasQuestion = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification,
      hasQuestion: null == hasQuestion
          ? _value.hasQuestion
          : hasQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationCopyWith<$Res> get notification {
    return $NotificationCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MyNotificationCopyWith<$Res>
    implements $MyNotificationCopyWith<$Res> {
  factory _$$_MyNotificationCopyWith(
          _$_MyNotification value, $Res Function(_$_MyNotification) then) =
      __$$_MyNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Notification notification, bool hasQuestion, String message});

  @override
  $NotificationCopyWith<$Res> get notification;
}

/// @nodoc
class __$$_MyNotificationCopyWithImpl<$Res>
    extends _$MyNotificationCopyWithImpl<$Res, _$_MyNotification>
    implements _$$_MyNotificationCopyWith<$Res> {
  __$$_MyNotificationCopyWithImpl(
      _$_MyNotification _value, $Res Function(_$_MyNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? hasQuestion = null,
    Object? message = null,
  }) {
    return _then(_$_MyNotification(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification,
      hasQuestion: null == hasQuestion
          ? _value.hasQuestion
          : hasQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MyNotification implements _MyNotification {
  const _$_MyNotification(
      {required this.notification,
      required this.hasQuestion,
      required this.message});

  @override
  final Notification notification;
  @override
  final bool hasQuestion;
  @override
  final String message;

  @override
  String toString() {
    return 'MyNotification(notification: $notification, hasQuestion: $hasQuestion, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyNotification &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.hasQuestion, hasQuestion) ||
                other.hasQuestion == hasQuestion) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, notification, hasQuestion, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyNotificationCopyWith<_$_MyNotification> get copyWith =>
      __$$_MyNotificationCopyWithImpl<_$_MyNotification>(this, _$identity);
}

abstract class _MyNotification implements MyNotification {
  const factory _MyNotification(
      {required final Notification notification,
      required final bool hasQuestion,
      required final String message}) = _$_MyNotification;

  @override
  Notification get notification;
  @override
  bool get hasQuestion;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_MyNotificationCopyWith<_$_MyNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
