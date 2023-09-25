import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';
import 'package:share_study_app/ui/view/profile/profile_screen.dart';

class ShareStudyDrawer extends HookConsumerWidget {
  const ShareStudyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfileState = ref.watch(myProfileStateProvider).asData?.value;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (
                          context,
                          animation1,
                          animation2,
                        ) =>
                            const ProfileScreen(),
                        transitionsBuilder: (
                          context,
                          animation1,
                          animation2,
                          child,
                        ) =>
                            SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation1),
                          child: child,
                        ),
                        transitionDuration: const Duration(milliseconds: 300),
                      ),
                    );
                  },
                  child: myProfileState?.imageUrl != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage(myProfileState!.imageUrl!),
                        )
                      : Icon(
                          Icons.account_circle_outlined,
                          size: 60,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                ),
                Text(
                  myProfileState?.nickname ?? '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Text(
                              myProfileState?.followCount.toString() ?? '',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 18,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          WidgetSpan(
                            child: Text(
                              ' フォロー',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 12,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          const WidgetSpan(child: SizedBox(width: 4)),
                          WidgetSpan(
                            child: Text(
                              myProfileState?.followerCount.toString() ?? '',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
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
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 12,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                        ],
                      ),
                    ),
                  ],
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
    );
  }
}
