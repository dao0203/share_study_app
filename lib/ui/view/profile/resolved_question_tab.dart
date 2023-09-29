import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/question_item.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';

class ResolvedQuestionTab extends StatefulHookConsumerWidget {
  const ResolvedQuestionTab({super.key, required this.profileId});
  final String profileId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnswerTabState();
}

class _AnswerTabState extends ConsumerState<ResolvedQuestionTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  static const _pageSize = 10;
  final PagingController<int, Question> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref
          .watch(questionRepositoryProvider)
          .getResolvedWithPaginationAndProfileId(
              widget.profileId, pageKey, _pageSize + pageKey);
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
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Question>(
          itemBuilder: (context, question, index) => QuestionItem(
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
            onIconPressed: () {},
          ),
          firstPageProgressIndicatorBuilder: (context) => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('質問を取得中...'),
            ],
          ),
          firstPageErrorIndicatorBuilder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('質問の取得に失敗しました'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _pagingController.retryLastFailedRequest(),
                child: const Text('再読み込み'),
              ),
            ],
          ),
          newPageErrorIndicatorBuilder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('質問の取得に失敗しました'),
              ElevatedButton(
                onPressed: () => _pagingController.retryLastFailedRequest(),
                child: const Text('再読み込み'),
              ),
            ],
          ),
          noItemsFoundIndicatorBuilder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('まだ解決済みの質問はありません'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _pagingController.refresh(),
                child: const Text('再読み込み'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
