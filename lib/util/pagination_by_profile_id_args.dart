import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_by_profile_id_args.freezed.dart';

@freezed
abstract class PaginationByProfileIdArgs with _$PaginationByProfileIdArgs {
  const factory PaginationByProfileIdArgs({
    required String profileId,
    required int start,
    required int end,
  }) = _PaginationByProfileIdArgs;
}
