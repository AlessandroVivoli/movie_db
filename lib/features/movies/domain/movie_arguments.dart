import 'package:freezed_annotation/freezed_annotation.dart';

import 'sort_by.dart';

part 'movie_arguments.freezed.dart';
part 'movie_arguments.g.dart';

@freezed
class MovieArguments with _$MovieArguments {
  const factory MovieArguments({
    required List<int> withGenres,
    @Default(SortBy.popularityDesc) SortBy sortBy,
    @Default(false) bool includeAdult,
  }) = _MovieArguments;

  factory MovieArguments.fromJson(Map<String, Object?> json) =>
      _$MovieArgumentsFromJson(json);
}