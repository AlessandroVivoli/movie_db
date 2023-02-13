import 'package:freezed_annotation/freezed_annotation.dart';

import 'sort_by.dart';

part 'media_arguments.freezed.dart';
part 'media_arguments.g.dart';

@freezed
class MediaArguments with _$MediaArguments {
  const factory MediaArguments({
    required List<int> withGenres,
    @Default(SortBy.popularityDesc) SortBy sortBy,
    @Default(false) bool includeAdult,
  }) = _MediaArguments;

  factory MediaArguments.fromJson(Map<String, Object?> json) =>
      _$MediaArgumentsFromJson(json);
}
