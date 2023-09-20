import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/my_activity_state.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';
import 'package:share_study_app/app/top_level_destination.dart';
import 'package:share_study_app/ui/view/question_post/question_post_screen.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      //TopLevelDestinationのすべてのページだけAppBarを表示する
      appBar: TopLevelDestination.values.contains(currentTab.value)
          ? AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                ),
                onPressed: () {
                  _scaffoldKey.value.currentState!.openDrawer();
                },
              ),
              //タイトルを中央に配置
              centerTitle: true,
              title: const Text('Share Study'),
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 1,
            )
          : null,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("質問投稿"),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const QuestionPostScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final begin = const Offset(0, 1);
                final end = Offset.zero;
                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: Curves.easeInOut));
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
      ),
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
        width: MediaQuery.of(context).size.width * 0.8,
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
                  const SizedBox(height: 4),
                  myActivityState.when(
                    data: (myActivity) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Text(
                                    myActivity.followCount.toString(),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontSize: 18,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                WidgetSpan(
                                  child: Text(
                                    ' フォロー',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontSize: 12,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                const WidgetSpan(child: SizedBox(width: 4)),
                                WidgetSpan(
                                  child: Text(
                                    myActivity.followerCount.toString(),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontSize: 18,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                const WidgetSpan(child: SizedBox(width: 4)),
                                WidgetSpan(
                                  child: Text(
                                    'フォロワー',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontSize: 12,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
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
              leading: const Icon(Icons.person_outline_outlined),
              title: const Text('プロフィール'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('シェアスタについて'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: const Text('利用規約'),
              onTap: () {
                //TODO: 利用規約の画面に遷移
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('プライバシーポリシー'),
              onTap: () {
                //TODO: プライバシーポリシーの画面に遷移
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_support_outlined),
              title: const Text('お問い合わせ'),
              onTap: () {
                //TODO: お問い合わせの画面に遷移
              },
            ),
            ListTile(
              textColor: Theme.of(context).colorScheme.error,
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.error,
              ),
              title: const Text('ログアウト'),
              onTap: () async {
                //TODO: ログアウト処理
                Navigator.pop(context);
                await ref.read(userAuthRepositoryProvider).signOut();
              },
            ),
          ],
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
