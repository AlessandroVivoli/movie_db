import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String? posterPath,
    required bool adult,
    required String? overview,
    required String? releaseDate,
    required List<int> genreIds,
    required int id,
    required String? originalTitle,
    required String? originalLanguage,
    required String? title,
    required String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
