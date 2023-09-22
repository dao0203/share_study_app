import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/app/share_study_drawer.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    final searchController = useTextEditingController();
    return Scaffold(
      key: scaffoldKey.value,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () => scaffoldKey.value.currentState!.openDrawer(),
        ),
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            hintText: '検索',
            border: InputBorder.none,
            suffixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const ShareStudyDrawer(),
      body: const Center(
        child: Text('検索'),
      ),
    );
  }
}
