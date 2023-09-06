import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_converter.dart';

part 'tv_show.freezed.dart';
part 'tv_show.g.dart';

@freezed
class TVShow with _$TVShow {
  const factory TVShow({
    required String? posterPath,
    required double popularity,
    required int id,
    required String? backdropPath,
    required double voteAverage,
    required String overview,
    @DateTimeConverter() required DateTime? firstAirDate,
    required List<String> originCountry,
    required List<int> genreIds,
    required int voteCount,
    required String name,
    required String originalName,
    @Default(false) bool adult,
  }) = _TVShow;

  factory TVShow.fromJson(Map<String, Object?> json) => _$TVShowFromJson(json);
}
