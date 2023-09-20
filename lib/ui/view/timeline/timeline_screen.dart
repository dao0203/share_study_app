import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/app/share_study_drawer.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';
import 'package:share_study_app/ui/view/timeline/components/question_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TimelineScreen extends StatefulHookConsumerWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  static const _pageSize = 5;
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
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    return Scaffold(
      key: scaffoldKey.value,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () {
            scaffoldKey.value.currentState?.openDrawer();
          },
        ),
        title: const Text('Share Study'),
      ),
      drawer: const ShareStudyDrawer(),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(
            () => _pagingController.refresh(),
          );
        },
        child: PagedListView<int, Question>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Question>(
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
            itemBuilder: (context, item, index) =>
                AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: QuestionItem(
                    question: item,
                    onPressed: () {
                      Navigator.of(context).push(
                        //横にスライドしながら画面遷移
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              DiscussionScreen(question: item),
                          transitionsBuilder: (context, animation1, animation2,
                                  child) =>
                              ScaleTransition(scale: animation1, child: child),
                        ),
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
          ),
        ),
      ),
    );
  }
}
