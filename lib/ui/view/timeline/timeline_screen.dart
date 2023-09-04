import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/timeline/components/question_list_items.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:share_study_app/util/pagination.dart';

class TimelineScreen extends StatefulHookConsumerWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  static const _pageSize = 1;
  final PagingController<int, Question> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      Logger().d('pageKey: $pageKey');
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    Logger().d('_fetchPage: $pageKey');
    try {
      final newItems = await ref
          .read(questionRepositoryProvider)
          .getWithPagination(pageKey, _pageSize + pageKey);
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
    final _scrollController = useScrollController();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, Question>(
          pagingController: _pagingController,
          scrollController: _scrollController,
          builderDelegate: PagedChildBuilderDelegate<Question>(
            itemBuilder: (context, item, index) =>
                AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: QuestionItem(
                    context,
                    index,
                    item,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
