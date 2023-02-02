import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/constants.dart';
import 'sort_by.dart';

part 'movie_arguments.freezed.dart';
part 'movie_arguments.g.dart';

@freezed
class MovieArguments with _$MovieArguments {
  const factory MovieArguments({
    required List<int>? withGenres,
    @Default(Sorts.popularityDesc) SortBy sortBy,
    required bool? includeAdult,
  }) = _MovieArguments;

  factory MovieArguments.fromJson(Map<String, Object?> json) =>
      _$MovieArgumentsFromJson(json);
}
