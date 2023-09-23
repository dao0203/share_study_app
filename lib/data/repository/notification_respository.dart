import 'package:share_study_app/data/domain/notification.dart';

abstract interface class NotificationRepository {
  Future<List<Notification>> getNotifications(String userId);
}
