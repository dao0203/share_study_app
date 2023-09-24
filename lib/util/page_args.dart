import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_args.freezed.dart';

@freezed
abstract class PageArgs with _$PageArgs {
  const factory PageArgs({
    required int start,
    required int end,
  }) = _PageArgs;
}
