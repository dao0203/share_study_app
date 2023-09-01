import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/my_activity_state.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';
import 'package:share_study_app/ui/view/app/top_level_destination.dart';

final _navigatorKey = <TopLevelDestination, GlobalKey<NavigatorState>>{
  for (final item in TopLevelDestination.values)
    item: GlobalKey<NavigatorState>(),
};

class ShareStudyApp extends HookConsumerWidget {
  const ShareStudyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfileState = ref.watch(myProfileStateProvider).asData?.value;
    final myActivityState = ref.watch(myActivityStateProvider);
    final currentTab = useState(TopLevelDestination.timeline);
    var _scaffoldKey = useState(GlobalKey<ScaffoldState>());
    return Scaffold(
      key: _scaffoldKey.value,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              _scaffoldKey.value.currentState!.openDrawer();
            },
          ),
          title: const Text('Share Study'),
          backgroundColor: Theme.of(context).colorScheme.surface),
      body: SafeArea(
        child: Stack(
          children: TopLevelDestination.values
              .map((item) => Offstage(
                    offstage: currentTab.value != item,
                    child: Navigator(
                      key: _navigatorKey[item],
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        settings: settings,
                        builder: (context) => item.page,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myProfileState?.imageUrl != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage(myProfileState!.imageUrl!),
                        )
                      : Icon(
                          Icons.account_circle_outlined,
                          size: 60,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  Text(
                    myProfileState?.nickname ?? '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 20,
                    ),
                  ),
                  myActivityState.when(
                    data: (myActivity) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: myActivity.followCount.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: '時間',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      Logger().e({error, stackTrace});
                      return const Text("エラーが発生しました");
                    },
                    loading: () {
                      return const Text("読み込み中");
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('ログアウト'),
              onTap: () async {
                Navigator.pop(context);
                await ref.read(userAuthRepositoryProvider).signOut();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: TopLevelDestination.values.indexOf(currentTab.value),
        items: TopLevelDestination.values
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
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
