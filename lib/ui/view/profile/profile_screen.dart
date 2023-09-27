import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/ui/state/activity_profile_state.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key, required this.profileId});
  final String profileId;

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final profileState =
        ref.watch(activityProfileStateProvider(widget.profileId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          //ユーザー情報
          profileState.when(
            data: (data) {
              return Row(
                children: [
                  //ユーザー画像
                  data.profile.imageUrl != null
                      ? Image.network(
                          data.profile.imageUrl!,
                          width: 80,
                        )
                      : const Icon(
                          Icons.account_circle_outlined,
                          size: 80,
                        ),
                  //ユーザー名
                  Text(
                    data.profile.nickname,
                    style: const TextStyle(fontSize: 20),
                  ),
                  //フォローボタン
                  TextButton(
                    onPressed: () {},
                    child: const Text('フォロー'),
                  ),
                ],
              );
            },
            error: (error, stackTrace) =>
                Text(error.toString() + stackTrace.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: '質問'),
              Tab(text: '実績'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                //質問
                Text('質問'),
                //実績
                Text('実績'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
