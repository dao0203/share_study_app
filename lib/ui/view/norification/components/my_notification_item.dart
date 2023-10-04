import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/my_notification.dart';
import 'package:share_study_app/util/date_formatter.dart';
import 'package:share_study_app/util/notification_type.dart';

class MyNotificationItem extends HookConsumerWidget {
  const MyNotificationItem(
      {super.key, required this.myNotification, required this.onTap});
  final MyNotification myNotification;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              switch (myNotification.notification.type) {
                NotificationType.follow => Icons.person_add,
                NotificationType.answer => Icons.question_answer,
                NotificationType.bestAnswer => Icons.star,
                NotificationType.newRegistration => Icons.cake
              },
              color: Theme.of(context).colorScheme.onSurface,
              size: 32,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myNotification.notification.sender != null
                          ? myNotification.notification.sender?.imageUrl != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    myNotification
                                        .notification.sender!.imageUrl!,
                                  ),
                                  radius: 20,
                                )
                              : Icon(
                                  Icons.person_outline_outlined,
                                  size: 40,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                )
                          : const SizedBox(),
                      //日付
                      const SizedBox(width: 8),

                      Text(
                        ref.watch(dateFormatterProvider).format(
                              myNotification.notification.createdAt,
                            ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    myNotification.message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  myNotification.hasQuestion
                      ? Text(
                          myNotification.notification.answerContent ?? '',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 16,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
