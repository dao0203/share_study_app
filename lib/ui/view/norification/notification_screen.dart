import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/app/share_study_drawer.dart';
import 'package:share_study_app/data/domain/my_notification.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';
import 'package:share_study_app/ui/view/norification/components/my_notification_item.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';
import 'package:share_study_app/util/pagination_args.dart';

class NotificationScreen extends StatefulHookConsumerWidget {
  const NotificationScreen({super.key});
  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  static const int _pageSize = 10;
  final PagingController<int, MyNotification> _pagingController =
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
          .watch(getMyNotificationsWithPaginationUseCaseProvider)
          .call(PaginationArgs(
            start: pageKey,
            end: pageKey + _pageSize,
          ));
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error, stacktrace) {
      Logger().e('getWithPagination.error: $error $stacktrace');
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
        leading: IconButton(
          icon: const Icon(Icons.account_circle_outlined),
          onPressed: () {
            scaffoldKey.value.currentState?.openDrawer();
          },
        ),
        title: const Text('通知'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<MyNotification>(
            itemBuilder: (context, myNotification, index) => MyNotificationItem(
              myNotification: myNotification,
              onTap: () {
                if (myNotification.hasQuestion) {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (
                        context,
                        animation1,
                        animation2,
                      ) =>
                          DiscussionScreen(
                              questionId:
                                  myNotification.notification.questionId!),
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
                }
              },
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
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('通知はありません。'),
            ),
          ),
        ),
      ),
      drawer: const ShareStudyDrawer(),
    );
  }
}
