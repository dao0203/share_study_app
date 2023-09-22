import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/app/share_study_drawer.dart';
import 'package:share_study_app/ui/view/search/search_content.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});
  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    final searchController = useTextEditingController();
    final keyword = useState('');
    final isSearchTextFieldEmpty = useState(true);
    final isSearching = useState(false);
    searchController.addListener(() {
      isSearchTextFieldEmpty.value = searchController.text.isEmpty;
    });

    return Scaffold(
      key: scaffoldKey.value,
      resizeToAvoidBottomInset: false,
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
            //丸くする
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
          ),
          //フォーカスされた時
          onTap: () {
            setState(() {
              isSearching.value = false;
            });
          },
          onSubmitted: (submittedKeyword) async {
            if (submittedKeyword.isEmpty) {
              return;
            }
            setState(() {
              Logger().d('submittedKeyword: $submittedKeyword');
              isSearching.value = true;
              keyword.value = submittedKeyword;
            });
          },
        ),
        centerTitle: true,
      ),
      drawer: const ShareStudyDrawer(),
      body: isSearching.value
          ? SearchContent(keyword: keyword.value)
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 100,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '検索をするとここに結果が表示されます',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
    );
  }
}
