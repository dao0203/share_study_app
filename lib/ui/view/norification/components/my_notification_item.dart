import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/my_notification.dart';
import 'package:share_study_app/ui/view/norification/components/other_notification_item.dart';
import 'package:share_study_app/ui/view/norification/components/question_notification_item.dart';

class MyNotificationItem extends HookConsumerWidget {
  const MyNotificationItem({super.key, required this.myNotification});
  final MyNotification myNotification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (myNotification.hasQuestion) {
      true => QuestionNotificationItem(myNotification: myNotification),
      false => OtherNotificationItem(myNotification: myNotification),
    };
  }
}
