import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/components/custom_snack_bar.dart';
import 'package:share_study_app/ui/state/question_state.dart';
import 'package:share_study_app/ui/state/question_ui_model_state.dart';
import 'package:share_study_app/ui/util/limit_text_ten_chars.dart';
import 'package:share_study_app/ui/view/discussion/components/answer_item.dart';
import 'package:share_study_app/ui/view/profile/profile_screen.dart';
import 'package:share_study_app/util/date_formatter.dart';

class DiscussionScreen extends StatefulHookConsumerWidget {
  const DiscussionScreen({super.key, required this.questionId});

  final String questionId;

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
              widget.questionId, pageKey, _pageSize + pageKey);
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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionUiModel =
        ref.watch(questionUiModelStateProvider(widget.questionId));
    final answerController = useTextEditingController();
    final areFieldEmpty = useState(true);
    final isAnswerLoading = useState(false);
    final answerXFile = useState<XFile?>(null);

    bool checkIfFieldsAreEmpty() {
      return answerController.text.isEmpty;
    }

    useEffect(() {
      answerController.addListener(() {
        areFieldEmpty.value = checkIfFieldsAreEmpty();
      });
      return null;
    }, [answerController]);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: questionUiModel.when(
              skipError: true,
              skipLoadingOnReload: true,
              skipLoadingOnRefresh: true,
              data: (questionUiModel) {
                return Icon(
                  Icons.check_circle_outline,
                  color:
                      questionUiModel.isResolved ? Colors.green : Colors.grey,
                );
              },
              error: (error, stackTrace) {
                Logger().e('error: $error $stackTrace');
                return const SizedBox();
              },
              loading: () => const SizedBox(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              questionUiModel.when(
                data: (questionUiModel) {
                  return Column(
                    children: [
                      Text(
                        questionUiModel.title,
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
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (
                                        context,
                                        animation1,
                                        animation2,
                                      ) =>
                                          ProfileScreen(
                                              profileId:
                                                  questionUiModel.questionerId),
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
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                child: questionUiModel.questionerImageUrl !=
                                        null
                                    ? CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                          questionUiModel.questionerImageUrl!,
                                        ),
                                      )
                                    : Icon(
                                        Icons.person_outline_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        size: 40,
                                      ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      limitTextTenChars(
                                          questionUiModel.questionerNickname),
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
                                    Text(
                                      ref
                                          .watch(dateFormatterProvider)
                                          .format(questionUiModel.createdAt),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.5),
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      questionUiModel.tags,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.7),
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                    Text(
                                      questionUiModel.content,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    //画像の表示
                                    questionUiModel.questionImageUrl != null
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                showGeneralDialog(
                                                  barrierDismissible: true,
                                                  barrierLabel: 'Label',
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  context: context,
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondaryAnimation) {
                                                    return DefaultTextStyle(
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                      child: Center(
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Stack(
                                                            children: [
                                                              InteractiveViewer(
                                                                minScale: 0.1,
                                                                maxScale: 5,
                                                                child: Image
                                                                    .network(
                                                                  questionUiModel
                                                                      .questionImageUrl!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  loadingBuilder: (context,
                                                                          child,
                                                                          loadingProgress) =>
                                                                      loadingProgress ==
                                                                              null
                                                                          ? child
                                                                          : const Center(
                                                                              child: CircularProgressIndicator(),
                                                                            ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                top: 0,
                                                                right: 0,
                                                                child: SafeArea(
                                                                  child:
                                                                      CloseButton(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .onSurface,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  questionUiModel
                                                      .questionImageUrl!,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) =>
                                                      loadingProgress == null
                                                          ? child
                                                          : const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  Logger().e('error: $error $stackTrace');
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          'エラーが発生しました',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onBackground,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => ref.refresh(
                              questionStateProvider(widget.questionId)),
                          child: const Text('リトライ'),
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 16),
              RefreshIndicator(
                onRefresh: () => Future.sync(
                  () => _pagingController.refresh(),
                ),
                child: PagedListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
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
                              questionerId:
                                  questionUiModel.asData?.value.questionerId ??
                                      '',
                              isMyQuestion:
                                  questionUiModel.asData?.value.isMyQuestion ??
                                      false,
                              onIconPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (
                                      context,
                                      animation1,
                                      animation2,
                                    ) =>
                                        ProfileScreen(
                                            profileId: answer.answerer.id),
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
                                    transitionDuration:
                                        const Duration(milliseconds: 300),
                                  ),
                                );
                              },
                              onLongPress: () async {
                                ref
                                    .watch(answerRepositoryProvider)
                                    .updateIsBestAnswer(
                                        answer.id, answer.isBestAnswer)
                                    .then((value) {
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pop();
                                  _pagingController.refresh();
                                  ref.invalidate(questionUiModelStateProvider(
                                      widget.questionId));
                                }).catchError(
                                  (error, stackTrace) {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                  },
                                );
                              },
                              isResolved:
                                  questionUiModel.asData?.value.isResolved ??
                                      false,
                            ),
                          ),
                        ),
                      );
                    },
                    firstPageErrorIndicatorBuilder: (context) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              'エラーが発生しました',
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => _pagingController.refresh(),
                              child: const Text('リトライ'),
                            ),
                          ],
                        ),
                      );
                    },
                    newPageErrorIndicatorBuilder: (context) => Center(
                      child: ElevatedButton(
                        onPressed: () => _pagingController.refresh(),
                        child: const Text('リトライ'),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: Text(
                        'まだコメントはありません',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onBackground,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final xFile = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (xFile != null) {
                          answerXFile.value = xFile;
                        }
                      },
                      icon: Icon(
                        Icons.image,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: answerController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
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
                    ),
                    isAnswerLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : IconButton(
                            onPressed: areFieldEmpty.value
                                ? null
                                : () async {
                                    FocusScope.of(context).unfocus();
                                    isAnswerLoading.value = true;
                                    await ref
                                        .read(answerRepositoryProvider)
                                        .addAnswer(
                                          widget.questionId,
                                          answerController.text,
                                          answerXFile.value?.path,
                                        )
                                        .then((value) {
                                      _pagingController.refresh();
                                      answerController.clear();
                                      answerXFile.value = null;
                                    }).catchError((error, stackTrace) {
                                      Logger().e('error: $error $stackTrace');
                                      String message = '';
                                      switch (error.message) {
                                        case 'failed to update image url':
                                          message = '画像のアップロードに失敗しました';
                                          break;
                                        case 'failed to add answer':
                                          message = 'コメントの投稿に失敗しました';
                                          break;
                                        case 'failed to upload image':
                                          message = '画像のアップロードに失敗しました';
                                        default:
                                          message = 'エラーが発生しました';
                                          break;
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        CustomSnackBar.createError(
                                          context: context,
                                          text: message,
                                          icon: Icon(
                                            Icons.error,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          ),
                                        ),
                                      );
                                    }).whenComplete(() {
                                      isAnswerLoading.value = false;
                                    });
                                  },
                            icon: const Icon(Icons.send),
                            color: areFieldEmpty.value
                                ? null
                                : Theme.of(context).colorScheme.surfaceTint,
                          )
                  ],
                ),
                const SizedBox(height: 8),
                //画像を選択した場合のみ表示
                answerXFile.value != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Image.file(
                              File(answerXFile.value!.path),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  answerXFile.value = null;
                                },
                                icon: const Icon(Icons.close),
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
