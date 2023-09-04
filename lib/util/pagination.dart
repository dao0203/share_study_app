// import 'dart:async';

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:logger/logger.dart';

// part 'pagination.freezed.dart';

// typedef PaginationRef<T> = AutoDisposeNotifierProviderRef<PaginationState<T>>;

// typedef Fetcher<T> = Future<List<T>> Function(int page);
// typedef FetcherFactory<T> = Fetcher<T> Function(PaginationRef<T> ref);

// AutoDisposeNotifierProvider<Pagination<T>, PaginationState<T>>
//     paginationProvider<T>(FetcherFactory<T> createFetcher) {
//   return NotifierProvider.autoDispose(
//     () => Pagination<T>(create: createFetcher),
//   );
// }

// @freezed
// class PaginationState<T> with _$PaginationState<T> {
//   const factory PaginationState({
//     required AsyncValue<List<T>> items,
//     @Default(0) int currentPage,
//     @Default(false) bool isCompleted,
//   }) = _PaginationState;
// }

// class Pagination<T> extends AutoDisposeNotifier<PaginationState<T>> {
//   Pagination({
//     required FetcherFactory<T> create,
//   }) : _create = create;

//   final _initState = PaginationState<T>(items: AsyncValue<List<T>>.loading());

//   final FetcherFactory<T> _create;
//   Future<List<T>> Function(int page) _fetcher = (page) async => [];
//   bool _isInitialized = false;

//   @override
//   PaginationState<T> build() {
//     _fetcher = _create(ref);
//     Logger().d('Pagination.build');
//     ref.onDispose(() {
//       Logger().d('Pagination.dispose');
//     });
//     unawaited(_init());
//     return _initState;
//   }

//   Future<void> _init() async {
//     if (_isInitialized) {
//       return;
//     }
//     _isInitialized = true;

//     // await Future.sync(() {});
//     await _fetch();
//   }

//   Future<void> fetchNext() async {
//     if (state.items.isLoading || state.isCompleted) {
//       return;
//     }

//     await _fetch();
//   }

//   Future<void> refetch() async {
//     Logger().d('Pagination.refetch');
//     if (state.items.isLoading) {
//       return;
//     }
//     state = _initState;
//     await _fetch();
//   }

//   Future<void> _fetch() async {
//     state = state.copyWith(
//       items: AsyncValue<List<T>>.loading().copyWithPrevious(state.items),
//     );

//     try {
//       final page = state.currentPage + 1;
//       final fetchedItems = await _fetcher(page);

//       final prevItems = state.items.valueOrNull ?? [];
//       final List<T> newItems = [...prevItems, ...fetchedItems];

//       Logger().d('Pagination.fetch: ${newItems.length}');
//       state = state.copyWith(
//         items: AsyncValue<List<T>>.data(newItems).copyWithPrevious(state.items),
//         currentPage: page,
//         isCompleted: fetchedItems.isEmpty,
//       );
//     } catch (e, stackTrace) {
//       state = state.copyWith(
//         items: AsyncValue<List<T>>.error(e, stackTrace)
//             .copyWithPrevious(state.items),
//       );
//     }
//   }
// }
