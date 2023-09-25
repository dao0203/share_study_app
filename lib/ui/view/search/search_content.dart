import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/question_item.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';

class SearchContent extends StatefulHookConsumerWidget {
  const SearchContent({super.key, required this.keyword});
  final String keyword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchContentState();
}

class _SearchContentState extends ConsumerState<SearchContent> {
  static const _pageSize = 10;
  final PagingController<int, Question> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(widget.keyword, pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
    return PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Question>(
        itemBuilder: (context, question, index) {
          return QuestionItem(
            question: question,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (
                    context,
                    animation1,
                    animation2,
                  ) =>
                      DiscussionScreen(questionId: question.id),
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
          );
        },
        firstPageErrorIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('エラーが発生しました。'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pagingController.refresh(),
              child: const Text('再読み込み'),
            ),
          ],
        ),
        newPageErrorIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('エラーが発生しました。'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pagingController.refresh(),
              child: const Text('再読み込み'),
            ),
          ],
        ),
        noItemsFoundIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('見つかりませんでした。'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pagingController.refresh(),
              child: const Text('再読み込み'),
            ),
          ],
        ),
        noMoreItemsIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('これ以上はありません。'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pagingController.refresh(),
              child: const Text('再読み込み'),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 2),
    );
  }
}
