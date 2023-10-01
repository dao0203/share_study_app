import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/follow/components/follow_item.dart';
import 'package:share_study_app/ui/view/profile/profile_screen.dart';

class FollowerTab extends StatefulHookConsumerWidget {
  const FollowerTab({super.key, required this.profileId});
  final String profileId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FollowerTabState();
}

class _FollowerTabState extends ConsumerState<FollowerTab>
    with AutomaticKeepAliveClientMixin<FollowerTab> {
  static const _pageSize = 10;
  final PagingController<int, Profile> _pagingController =
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
          .read(profileRepositoryProvider)
          .getFollowersWithPagination(
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
    super.build(context);
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView<int, Profile>.separated(
        separatorBuilder: (context, index) => const Divider(),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Profile>(
          itemBuilder: (context, profile, index) => FollowItem(
            profile: profile,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (
                    context,
                    animation1,
                    animation2,
                  ) =>
                      ProfileScreen(profileId: profile.id),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
