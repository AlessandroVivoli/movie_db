import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_converter.dart';
import '../../../core/converters/vote_average_converter.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String? posterPath,
    required bool adult,
    required String overview,
    @DateTimeConverter() required DateTime? releaseDate,
    required List<int>? genreIds,
    required int id,
    required String originalTitle,
    required String originalLanguage,
    required String title,
    required String? backdropPath,
    required double? popularity,
    required int? voteCount,
    required bool? video,
    @VoteAverageConverter() required double voteAverage,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
