import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_args.freezed.dart';

@freezed
abstract class PaginationArgs with _$PaginationArgs {
  const factory PaginationArgs({
    required int limit,
    required int offset,
  }) = _PaginationArgs;
}
