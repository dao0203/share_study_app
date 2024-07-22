import 'package:flutter/material.dart';
import 'package:share_study_app/ui/view/notification/notification_screen.dart';
import 'package:share_study_app/ui/view/search/search_screen.dart';
import 'package:share_study_app/ui/view/timeline/timeline_screen.dart';

enum TopLevelDestination {
  timeline(
    tag: 'timeline',
    label: 'タイムライン',
    icon: Icons.timeline,
    page: TimelineScreen(),
  ),
  search(
    tag: 'search',
    label: '検索',
    icon: Icons.search,
    page: SearchScreen(),
  ),
  notification(
    tag: 'notification',
    label: '通知',
    icon: Icons.notifications,
    page: NotificationScreen(),
  );

  //コンストラクを追加

  const TopLevelDestination({
    required this.tag,
    required this.label,
    required this.icon,
    required this.page,
  });
  final String tag;
  final String label;
  final IconData icon;
  final Widget page;
}
