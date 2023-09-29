import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/ui/state/activity_profile_state.dart';
import 'package:share_study_app/ui/view/profile/resolved_question_tab.dart';
import 'package:share_study_app/ui/view/profile/quetion_tab.dart';

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
    return Scaffold(
      appBar: AppBar(
        //Appbarの背景色を変更
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
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
                      data: (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                //ユーザー画像
                                data.profile.imageUrl != null
                                    ? Image.network(
                                        data.profile.imageUrl!,
                                        width: 80,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          Logger().e(error);
                                          return const Icon(
                                            Icons.error_outline_outlined,
                                            size: 80,
                                          );
                                        },
                                      )
                                    : const Icon(
                                        Icons.account_circle_outlined,
                                        size: 80,
                                      ),
                                //ユーザー名
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.profile.nickname,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: data.profile.followCount
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {},
                                          ),
                                          const TextSpan(text: ' フォロー'),
                                          const TextSpan(text: '   '),
                                          TextSpan(
                                            text: data.profile.followerCount
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {},
                                          ),
                                          const TextSpan(text: ' フォロワー'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //フォローボタン
                                data.isMyProfile
                                    ? const SizedBox()
                                    : ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('フォロー'),
                                      ),
                              ],
                            ),
                          ),
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
                                  Theme.of(context).colorScheme.onBackground,
                              iconColor:
                                  Theme.of(context).colorScheme.onBackground,
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
                          Text(error.toString() + stackTrace.toString()),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
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
          body: TabBarView(
            children: [
              QuetionTab(profileId: widget.profileId),
              ResolvedQuestionTab(profileId: widget.profileId),
            ],
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
      color: Theme.of(context).colorScheme.background,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
