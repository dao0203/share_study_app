import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/domain/question.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/view/discussion/components/answer_item.dart';

class DiscussionScreen extends StatefulHookConsumerWidget {
  const DiscussionScreen({super.key, required this.question});
  final Question question;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscussionScreenState();
}

class _DiscussionScreenState extends ConsumerState<DiscussionScreen> {
  static const _pageSize = 10;
  final PagingController<int, Answer> _pagingController =
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
          .watch(answerRepositoryProvider)
          .getAnswersByQuestionIdWithPagination(
              widget.question.id, pageKey, _pageSize + pageKey);
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
    final question = widget.question;
    final commentController = useTextEditingController();
    final areFieldEmpty = useState(true);

    bool checkIfFieldsAreEmpty() {
      return commentController.text.isEmpty;
    }

    useEffect(() {
      commentController.addListener(() {
        areFieldEmpty.value = checkIfFieldsAreEmpty();
      });
      return null;
    }, [commentController]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              question.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              elevation: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: question.questioner.imageUrl != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(question.questioner.imageUrl!),
                            radius: 40,
                          )
                        : Icon(
                            Icons.person_outline_outlined,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            size: 40,
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                question.questioner.nickname,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    '${question.createdAt.month}月${question.createdAt.day}日',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            question.content,
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onBackground,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PagedListView(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Answer>(
                  itemBuilder: (context, answer, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 300),
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: AnswerItem(
                            answer: answer,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'コメントを入力',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
              ),
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onBackground,
                letterSpacing: 1.5,
              ),
            ),
          ),
          IconButton(
            onPressed: areFieldEmpty.value
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    await ref
                        .read(answerRepositoryProvider)
                        .addAnswer(
                          question.id,
                          commentController.text,
                        )
                        .then((value) {
                      _pagingController.refresh();
                    }).catchError((error) {
                      SnackBar(content: Text(error.toString()));
                    });
                    commentController.clear();
                  },
            icon: const Icon(Icons.send),
            color: areFieldEmpty.value
                ? null
                : Theme.of(context).colorScheme.surfaceTint,
          ),
        ],
      ),
    );
  }
}
