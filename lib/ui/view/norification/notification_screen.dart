import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/my_notification.dart';
import 'package:share_study_app/ui/view/discussion/discussion_screen.dart';
import 'package:share_study_app/ui/view/norification/components/my_notification_item.dart';
import 'package:share_study_app/use_case/di/use_case_providers.dart';
import 'package:share_study_app/util/page_args.dart';

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
          .call(PageArgs(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
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
                    MaterialPageRoute(
                      builder: (context) => DiscussionScreen(
                        questionId: myNotification.notification.questionId!,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
