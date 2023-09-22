import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/app/share_study_drawer.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});
  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  static const _pageSize = 10;
  final PagingController<int, Question> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchPage(String keyword, int pageKey) async {
    try {
      final newItems = await ref
          .read(questionRepositoryProvider)
          .getWithPaginationAndKeyword(pageKey, _pageSize + pageKey, keyword);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    final searchController = useTextEditingController();
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
          onSubmitted: (keyword) async {
            setState(() {
              isSearching.value = true;
            });
            _pagingController.addPageRequestListener((pageKey) {
              Logger().d('pageKey: $pageKey');
              _fetchPage(keyword, pageKey);
            });
            _fetchPage(keyword, 0);
            isSearching.value = false;
          },
        ),
        centerTitle: true,
      ),
      drawer: const ShareStudyDrawer(),
      body: isSearching.value
          ? PagedListView.separated(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Question>(
                itemBuilder: (context, item, index) {
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.subjectName),
                  );
                },
              ),
              separatorBuilder: (context, index) => const Divider())
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
