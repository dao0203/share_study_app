import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/notification.dart';

part 'my_notification.freezed.dart';

@freezed
abstract class MyNotification with _$MyNotification {
  const factory MyNotification({
    required Notification notification,
    required bool hasQuestion,
    required String message,
  }) = _MyNotification;
}
