import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationItem extends HookConsumerWidget {
  const NotificationItem({super.key, required this.notification});
  final Notification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
