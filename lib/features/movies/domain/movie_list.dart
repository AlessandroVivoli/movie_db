import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie.dart';

part 'movie_list.freezed.dart';
part 'movie_list.g.dart';

@freezed
class MovieListModel with _$MovieListModel {
  const factory MovieListModel({
    required int page,
    required List<Movie> results,
    required int totalPages,
    required int totalResults,
  }) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, Object?> json) =>
      _$MovieListModelFromJson(json);
}
