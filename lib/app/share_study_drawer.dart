import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/app/app_router.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/custom_snack_bar.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';
import 'package:share_study_app/ui/util/limit_text_ten_chars.dart';
import 'package:share_study_app/util/email_sender.dart';

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
                    context.push(
                      AppRouter.profile,
                      extra: myProfileState!.id,
                    );
                  },
                  child: myProfileState?.imageUrl != null
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(myProfileState!.imageUrl!),
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                        )
                      : Icon(
                          Icons.account_circle_outlined,
                          size: 60,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                ),
                Text(
                  limitTextTenChars(myProfileState?.nickname ?? ''),
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
            onTap: () {
              if (myProfileState == null) return;
              context.push(
                AppRouter.profile,
                extra: myProfileState.id,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('シェアスタについて'),
            onTap: () {
              context.push(AppRouter.aboutApp);
            },
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('利用規約'),
            onTap: () {
              context.push(AppRouter.tos);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('プライバシーポリシー'),
            onTap: () {
              context.push(AppRouter.privacyPolicy);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support_outlined),
            title: const Text('お問い合わせ'),
            onTap: () async {
              showGeneralDialog(
                context: context,
                pageBuilder: (
                  context,
                  animation1,
                  animation2,
                ) {
                  return AlertDialog(
                    title: const Text('お問い合わせ'),
                    content: const Text('外部のメールアプリに遷移します'),
                    actions: [
                      TextButton(
                        child: const Text('キャンセル'),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      TextButton(
                        child: const Text('起動'),
                        onPressed: () async {
                          await ref
                              .watch(emailSenderProvider)
                              .setupEmail()
                              .catchError(
                            (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackBar.createError(
                                  context: context,
                                  text: 'お問い合わせに失敗しました',
                                ),
                              );
                            },
                          ).whenComplete(() {
                            context.pop();
                          });
                        },
                      ),
                    ],
                  );
                },
              );
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
              // alert dialogを表示
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // ログアウト時に表示するalert dialog
                  return AlertDialog(
                    title: const Text('ログアウト'),
                    content: const Text('ログアウトしますか？'),
                    actions: [
                      TextButton(
                        child: const Text('キャンセル'),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      TextButton(
                        child: const Text('ログアウト'),
                        onPressed: () async {
                          showGeneralDialog(
                            barrierDismissible: false,
                            context: context,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return WillPopScope(
                                onWillPop: () async => false,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          );
                          ref.watch(userAuthRepositoryProvider).signOut().then(
                            (value) {
                              context.go(AppRouter.signIn);
                            },
                          ).catchError(
                            (error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackBar.createError(
                                  context: context,
                                  text: 'ログアウトに失敗しました',
                                  icon: Icon(
                                    Icons.error,
                                    color:
                                        Theme.of(context).colorScheme.onError,
                                  ),
                                ),
                              );
                              context
                                ..pop()
                                ..pop();
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
