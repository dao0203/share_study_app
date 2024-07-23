import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/app/app_router.dart';
import 'package:share_study_app/app/share_study_drawer.dart';
import 'package:share_study_app/ui/components/question_item.dart';
import 'package:share_study_app/ui/components/question_post_fab.dart';
import 'package:share_study_app/ui/ui_model/question_ui_model.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';
import 'package:share_study_app/util/pagination_args.dart';

class TimelineScreen extends StatefulHookConsumerWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  static const _pageSize = 30;
  final PagingController<int, QuestionUiModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      Logger().d('pageKey: $pageKey');
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ref
          .read(getQuestionsWithPaginationUseCaseProvider)
          .call(
            param: PaginationArgs(
              limit: _pageSize,
              offset: pageKey,
            ),
          )
          .then((value) {
        return value.map((e) {
          return QuestionUiModel.fromQuestionUseCaseModel(
            questionUseCaseModel: e,
          );
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
      Logger().e('error: $error, stackTrace: $stackTrace');
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    return Scaffold(
      key: scaffoldKey.value,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () {
            scaffoldKey.value.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: const Text('Share Study'),
      ),
      floatingActionButton: QuestionPostFAB(
        label: '質問する',
        onPressed: () {
          context.push(AppRouter.questionPost);
        },
      ),
      drawer: const ShareStudyDrawer(),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(
            () => _pagingController.refresh(),
          );
        },
        child: PagedListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<QuestionUiModel>(
            firstPageErrorIndicatorBuilder: (context) {
              return const Center(
                child: Text('エラーが発生しました'),
              );
            },
            firstPageProgressIndicatorBuilder: (context) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('質問を取得中...'),
                  ],
                ),
              );
            },
            itemBuilder: (context, question, index) =>
                AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: QuestionItem(
                    questionUiModel: question,
                    onIconPressed: () {
                      context.push(
                        AppRouter.profile,
                        extra: question.questionerId,
                      );
                    },
                    onPressed: () {
                      context.push(
                        AppRouter.discuss,
                        extra: question.id,
                      );
                    },
                  ),
                ),
              ),
            ),
            newPageErrorIndicatorBuilder: (context) {
              return const Center(
                child: Text('エラーが発生しました'),
              );
            },
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('質問がありません'),
            ),
          ),
        ),
      ),
    );
  }
}
