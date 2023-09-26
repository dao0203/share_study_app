import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('プロフィール'),
        //質問と実績の切り替えるバーを作る
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '質問'),
            Tab(text: '実績'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          //質問
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('質問タイトル'),
                subtitle: Text('質問内容'),
                trailing: Text('回答数'),
              );
            },
          ),
          //実績
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('実績タイトル'),
                subtitle: Text('実績内容'),
                trailing: Text('獲得ポイント'),
              );
            },
          ),
        ],
      ),
    );
  }
}
