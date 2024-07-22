import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/ui/view/follow/follow_tab.dart';
import 'package:share_study_app/ui/view/follow/follower_tab.dart';

class FollowScreen extends HookConsumerWidget {
  const FollowScreen({
    super.key,
    required this.profileId,
    required this.initialIndex,
  });
  final String profileId;
  final int initialIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('フォロー'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'フォロー'),
              Tab(text: 'フォロワー'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowTab(profileId: profileId),
            FollowerTab(profileId: profileId),
          ],
        ),
      ),
    );
  }
}
