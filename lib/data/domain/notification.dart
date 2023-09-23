import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/data/domain/profile.dart';

part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String message,
    required Profile sender,
    String? questionId,
    required DateTime createdAt,
  }) = _Notification;
}
