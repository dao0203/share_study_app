import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/ui/components/question_item.dart';
import 'package:share_study_app/ui/ui_model/question_ui_model.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';
import 'package:share_study_app/ui/view/profile/profile_screen.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';
import 'package:share_study_app/util/pagination_by_keyword_args.dart';

class SearchContent extends StatefulHookConsumerWidget {
  const SearchContent({super.key, required this.keyword});
  final String keyword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchContentState();
}

class _SearchContentState extends ConsumerState<SearchContent> {
  static const _pageSize = 10;
  final PagingController<int, QuestionUiModel> _pagingController =
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
          .read(getQuestionsWithPaginationAndKeywordUseCaseProvider)
          .call(
              param: PaginationByKeywordArgs(
            keyword: keyword,
            offsetAmount: pageKey,
            limitAmount: _pageSize,
          ))
          .then((value) {
        return value.map((e) {
          return QuestionUiModel.fromQuestionUseCaseModel(
              questionUseCaseModel: e);
        }).toList();
      });
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error, stackTrace) {
      Logger().e('error: $error' 'stackTrace: $stackTrace');
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
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<QuestionUiModel>(
          itemBuilder: (context, questionUiModel, index) {
            return QuestionItem(
              questionUiModel: questionUiModel,
              onIconPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation1,
                      animation2,
                    ) =>
                        ProfileScreen(profileId: questionUiModel.questionerId),
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
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (
                      context,
                      animation1,
                      animation2,
                    ) =>
                        DiscussionScreen(questionId: questionUiModel.id),
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
          noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 2),
      ),
    );
  }
}
