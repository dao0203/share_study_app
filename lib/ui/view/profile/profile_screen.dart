import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/custom_snack_bar.dart';
import 'package:share_study_app/ui/state/activity_profile_state.dart';
import 'package:share_study_app/ui/state/is_blocking_state.dart';
import 'package:share_study_app/ui/state/is_following_state.dart';
import 'package:share_study_app/ui/view/follow/follow_screen.dart';
import 'package:share_study_app/ui/view/profile/profile_setting_screen.dart';
import 'package:share_study_app/ui/view/profile/quetion_tab.dart';
import 'package:share_study_app/ui/view/profile/resolved_question_tab.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key, required this.profileId});
  final String profileId;

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final profileState =
        ref.watch(activityProfileStateProvider(widget.profileId));
    final isBlockingState =
        ref.watch(isBlockingStateProvider(widget.profileId));
    final isFollowingState =
        ref.watch(isFollowingStateProvider(widget.profileId));
    return Scaffold(
      appBar: AppBar(
        //Appbarの背景色を変更
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          profileState.when(
            skipError: true,
            skipLoadingOnRefresh: true,
            skipLoadingOnReload: true,
            data: (data) => data.isMyProfile
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isBlockingState.when(
                                  skipError: true,
                                  skipLoadingOnRefresh: true,
                                  skipLoadingOnReload: true,
                                  data: (isBlocking) {
                                    return ListTile(
                                      leading: Icon(
                                        Icons.block,
                                        color: isBlocking ? null : Colors.red,
                                      ),
                                      title: Text(
                                        isBlocking ? 'ブロック解除' : 'ブロック',
                                        style: TextStyle(
                                          color: isBlocking ? null : Colors.red,
                                        ),
                                      ),
                                      onTap: () async {
                                        if (isBlocking) {
                                          //ブロック解除
                                          await ref
                                              .read(profileRepositoryProvider)
                                              .unblock(data.profile.id)
                                              .then(
                                            (value) {
                                              ref.invalidate(
                                                isBlockingStateProvider(
                                                  widget.profileId,
                                                ),
                                              );
                                            },
                                          ).catchError(
                                            (error) {
                                              Logger().e(
                                                'error: $error stackTrace: $error',
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                CustomSnackBar.createError(
                                                  context: context,
                                                  text: 'ブロック解除に失敗しました',
                                                ),
                                              );
                                            },
                                          ).whenComplete(
                                            () => Navigator.of(context).pop(),
                                          );
                                        } else {
                                          //ブロック
                                          await ref
                                              .read(profileRepositoryProvider)
                                              .block(
                                                profileId: data.profile.id,
                                              )
                                              .then((value) {
                                            ref.invalidate(
                                              isBlockingStateProvider(
                                                widget.profileId,
                                              ),
                                            );
                                          }).catchError((error) {
                                            Logger().e(
                                              'error: $error stackTrace: $error',
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              CustomSnackBar.createError(
                                                context: context,
                                                text: 'ブロックに失敗しました',
                                              ),
                                            );
                                          }).whenComplete(
                                            () => Navigator.of(context).pop(),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  error: (error, stackTrace) {
                                    Logger().e(
                                      'error: $error stackTrace: $stackTrace',
                                    );
                                    return const SizedBox();
                                  },
                                  loading: () {
                                    return const SizedBox();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
            error: (error, stackTrace) => const SizedBox(),
            loading: () => const SizedBox(),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileState.when(
                      skipLoadingOnReload: true,
                      skipLoadingOnRefresh: true,
                      data: (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              //外いっぱいに広げる
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //ユーザー画像
                                data.profile.imageUrl != null
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                          data.profile.imageUrl!,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      )
                                    : const Icon(
                                        Icons.account_circle_outlined,
                                        size: 80,
                                      ),
                                //ユーザー名
                                const SizedBox(width: 16),
                                //フォローボタン
                                data.isMyProfile
                                    ? ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) {
                                                return ProfileSettingScreen(
                                                  profile: data.profile,
                                                );
                                              },
                                              fullscreenDialog: true,
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          elevation: 4,
                                        ),
                                        child: Text(
                                          '編集・設定',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                      )
                                    : isBlockingState.when(
                                        error: (error, stackTrace) {
                                          Logger().e(
                                            'error: $error stackTrace: $stackTrace',
                                          );
                                          return const SizedBox();
                                        },
                                        loading: () {
                                          return const SizedBox();
                                        },
                                        data: (isBlocking) {
                                          return isBlocking
                                              ? ElevatedButton(
                                                  onPressed: () async {
                                                    //ブロック解除する
                                                    showGeneralDialog(
                                                      context: context,
                                                      pageBuilder: (
                                                        context,
                                                        animation1,
                                                        animation2,
                                                      ) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                            'ブロック解除',
                                                          ),
                                                          content: const Text(
                                                            '本当にブロック解除しますか？',
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                              },
                                                              child: const Text(
                                                                'キャンセル',
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed:
                                                                  () async {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                                await ref
                                                                    .read(
                                                                      profileRepositoryProvider,
                                                                    )
                                                                    .unblock(
                                                                      widget
                                                                          .profileId,
                                                                    )
                                                                    .then(
                                                                        (value) {
                                                                  ref.invalidate(
                                                                    isBlockingStateProvider(
                                                                      widget
                                                                          .profileId,
                                                                    ),
                                                                  );
                                                                }).catchError(
                                                                        (error) {
                                                                  Logger().e(
                                                                    'error: $error stackTrace: $error',
                                                                  );
                                                                  ScaffoldMessenger
                                                                      .of(
                                                                    context,
                                                                  ).showSnackBar(
                                                                    CustomSnackBar
                                                                        .createError(
                                                                      context:
                                                                          context,
                                                                      text:
                                                                          'ブロック解除に失敗しました',
                                                                    ),
                                                                  );
                                                                });
                                                              },
                                                              child: const Text(
                                                                'ブロック解除',
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red
                                                        .withOpacity(0.8),
                                                    elevation: 4,
                                                  ),
                                                  child: Text(
                                                    'ブロック中',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    ),
                                                  ),
                                                )
                                              : isFollowingState.when(
                                                  data: (isFollowing) {
                                                    return ElevatedButton(
                                                      onPressed: () async {
                                                        if (isFollowing) {
                                                          //フォロー解除する
                                                          await ref
                                                              .read(
                                                                profileRepositoryProvider,
                                                              )
                                                              .unfollow(
                                                                widget
                                                                    .profileId,
                                                              )
                                                              .then(
                                                            (value) {
                                                              ref.invalidate(
                                                                isFollowingStateProvider(
                                                                  widget
                                                                      .profileId,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          //フォローする
                                                          await ref
                                                              .read(
                                                                profileRepositoryProvider,
                                                              )
                                                              .follow(
                                                                widget
                                                                    .profileId,
                                                              )
                                                              .then(
                                                            (value) {
                                                              ref.invalidate(
                                                                isFollowingStateProvider(
                                                                  widget
                                                                      .profileId,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            isFollowing
                                                                ? Theme.of(
                                                                    context,
                                                                  )
                                                                    .colorScheme
                                                                    .inversePrimary
                                                                : Theme.of(
                                                                    context,
                                                                  )
                                                                    .colorScheme
                                                                    .onSurface,
                                                        elevation: 4,
                                                      ),
                                                      child: Text(
                                                        isFollowing
                                                            ? 'フォロー中'
                                                            : 'フォローする',
                                                        style: TextStyle(
                                                          color: isFollowing
                                                              ? Theme.of(
                                                                  context,
                                                                )
                                                                  .colorScheme
                                                                  .onSurface
                                                              : Theme.of(
                                                                  context,
                                                                )
                                                                  .colorScheme
                                                                  .surface,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  error: (error, stackTrace) {
                                                    Logger().e(
                                                      'error: $error stackTrace: $stackTrace',
                                                    );
                                                    return const SizedBox();
                                                  },
                                                  loading: () =>
                                                      const SizedBox(),
                                                );
                                        },
                                      ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              data.profile.nickname,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: data.profile.followCount.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  フォロー',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (
                                              context,
                                              animation1,
                                              animation2,
                                            ) =>
                                                FollowScreen(
                                              profileId: data.profile.id,
                                              initialIndex: 0,
                                            ),
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
                                            transitionDuration: const Duration(
                                              milliseconds: 300,
                                            ),
                                          ),
                                        );
                                      },
                                  ),
                                  const TextSpan(text: '   '),
                                  TextSpan(
                                    text: data.profile.followerCount.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' フォロワー',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (
                                              context,
                                              animation1,
                                              animation2,
                                            ) =>
                                                FollowScreen(
                                              profileId: data.profile.id,
                                              initialIndex: 1,
                                            ),
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
                                            transitionDuration: const Duration(
                                              milliseconds: 300,
                                            ),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          //大学名
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              data.profile.universityName,
                              style: TextStyle(
                                fontSize: 16,
                                //すこし透明にする
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7),
                              ),
                            ),
                          ),
                          //学部名
                          data.profile.facultyName != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    data.profile.facultyName!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      //すこし透明にする
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          //学科名
                          data.profile.departmentName != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    data.profile.departmentName!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      //すこし透明にする
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(width: 8),
                          //学年
                          data.profile.grade != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    data.profile.grade!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      //すこし透明にする
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          //自己紹介
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              data.profile.bio ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          //実績のトグルボタン
                          const SizedBox(height: 8),
                          Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              title: const Text('実績'),
                              leading: const Icon(Icons.emoji_events_outlined),
                              collapsedIconColor:
                                  Theme.of(context).colorScheme.onSurface,
                              iconColor:
                                  Theme.of(context).colorScheme.onSurface,
                              children: [
                                ListTile(
                                  title: const Text('質問'),
                                  trailing: Text(
                                    data.profile.questionCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Text('回答'),
                                  trailing: Text(
                                    data.profile.answerCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Text('ベストアンサーされた数'),
                                  trailing: Text(
                                    data.profile.bestAnswerCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      error: (error, stackTrace) =>
                          const Center(child: Text('エラーが発生しました')),
                      loading: () => const SizedBox(),
                    ),
                  ],
                ),
              ),
              const SliverPersistentHeader(
                pinned: true,
                delegate: _StickyTabBarDelegate(
                  tabBar: TabBar(
                    tabs: [
                      Tab(text: '質問'),
                      Tab(text: '解決した質問'),
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: isBlockingState.when(
            skipError: true,
            skipLoadingOnRefresh: true,
            skipLoadingOnReload: true,
            data: (isBlocking) {
              return isBlocking
                  ? const Center(
                      child: Text('ブロックしているため、質問を見ることができません'),
                    )
                  : TabBarView(
                      children: [
                        QuetionTab(profileId: widget.profileId),
                        ResolvedQuestionTab(profileId: widget.profileId),
                      ],
                    );
            },
            error: (error, stackTrace) {
              Logger().e('error: $error stackTrace: $stackTrace');
              return const SizedBox();
            },
            loading: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

//こちらを参考にして実装
//https://zenn.dev/wakanao/articles/0ff4bc3f08f34a
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
