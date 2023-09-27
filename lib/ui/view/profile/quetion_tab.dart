import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/question_item.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';

class QuetionTab extends StatefulHookConsumerWidget {
  const QuetionTab({super.key, required this.profileId});
  final String profileId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuetionTabState();
}

class _QuetionTabState extends ConsumerState<QuetionTab>
    with AutomaticKeepAliveClientMixin {
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

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref
          .read(questionRepositoryProvider)
          .getWithPaginationAndUserId(
              pageKey, _pageSize + pageKey, widget.profileId);
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
    super.build(context);
    return PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Question>(
        itemBuilder: (context, question, index) =>
            AnimationConfiguration.staggeredList(
          position: index,
          child: FadeInAnimation(
            child: QuestionItem(
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
            ),
          ),
        ),
        firstPageProgressIndicatorBuilder: (context) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('質問を取得中...'),
            ],
          );
        },
        newPageErrorIndicatorBuilder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('エラーが発生しました'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _pagingController.retryLastFailedRequest(),
                child: const Text('再読み込み'),
              ),
            ],
          );
        },
        firstPageErrorIndicatorBuilder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('エラーが発生しました'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _pagingController.refresh(),
                child: const Text('再読み込み'),
              ),
            ],
          );
        },
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
