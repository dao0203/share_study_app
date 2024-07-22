import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/app/top_level_destination.dart';

class BottomNavAppBar extends ConsumerWidget {
  const BottomNavAppBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        items: TopLevelDestination.values
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                activeIcon: Icon(
                  item.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: item.label,
              ),
            )
            .toList(),
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
