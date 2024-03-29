import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/util/notification_type.dart';

part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required Profile? sender,
    String? questionId,
    String? answerContent,
    required NotificationType type,
    required DateTime createdAt,
  }) = _Notification;
}
