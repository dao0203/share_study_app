import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/my_notification.dart';

class QuestionNotificationItem extends HookConsumerWidget {
  const QuestionNotificationItem({super.key, required this.myNotification});
  final MyNotification myNotification;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
