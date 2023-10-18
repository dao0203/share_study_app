import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_by_keyword_args.freezed.dart';

@freezed
abstract class PaginationByKeywordArgs with _$PaginationByKeywordArgs {
  const factory PaginationByKeywordArgs({
    required String keyword,
    required int offsetAmount,
    required int limitAmount,
  }) = _PaginationByKeywordArgs;
}
