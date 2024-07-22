import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/app/top_level_destination.dart';

final _navigatorKey = <TopLevelDestination, GlobalKey<NavigatorState>>{
  for (final item in TopLevelDestination.values)
    item: GlobalKey<NavigatorState>(),
};

class ShareStudyApp extends HookConsumerWidget {
  const ShareStudyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = useState(TopLevelDestination.timeline);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: TopLevelDestination.values
              .map(
                (item) => Offstage(
                  offstage: currentTab.value != item,
                  child: Navigator(
                    key: _navigatorKey[item],
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      settings: settings,
                      builder: (context) => item.page,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        currentIndex: TopLevelDestination.values.indexOf(currentTab.value),
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
        onTap: (index) {
          final selectedTab = TopLevelDestination.values[index];
          if (selectedTab == currentTab.value) {
            _navigatorKey[selectedTab]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            currentTab.value = selectedTab;
          }
        },
      ),
    );
  }
}
