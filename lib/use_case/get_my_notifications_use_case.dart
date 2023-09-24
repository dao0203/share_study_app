import 'package:share_study_app/data/domain/my_notification.dart';
import 'package:share_study_app/data/domain/notification.dart';
import 'package:share_study_app/data/repository/notification_respository.dart';
import 'package:share_study_app/use_case/use_case.dart';
import 'package:share_study_app/util/notification_type.dart';
import 'package:share_study_app/util/page_args.dart';

class GetMyNotificationsWithPaginationUseCase
    extends UseCase<PageArgs, Future<List<MyNotification>>> {
  final NotificationRepository _notificationRepository;
  GetMyNotificationsWithPaginationUseCase(this._notificationRepository);
  @override
  Future<List<MyNotification>> call(PageArgs param) async {
    return await _notificationRepository
        .getWithPagination(
      param.start,
      param.end,
    )
        .then((value) {
      return value
          .map((e) => MyNotification(
                notification: e,
                hasQuestion: e.questionId != null,
                message: createMessage(e),
              ))
          .toList();
    });
  }

  String createMessage(Notification notification) {
    switch (notification.type) {
      case NotificationType.answer:
        return '${notification.sender.nickname}さんがあなたの質問に回答しました';
      case NotificationType.bestAnswer:
        return 'あなたの質問にベストアンサーがつきました';
      case NotificationType.newRegistration:
        return 'シェアスタに登録しました';
      case NotificationType.follow:
        return '${notification.sender.nickname}さんがフォローしました';
    }
  }
}
