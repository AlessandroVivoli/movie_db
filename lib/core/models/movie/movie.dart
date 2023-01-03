import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String? poster_path,
    required bool adult,
    required String overview,
    required DateTime release_date,
    required List<int> genre_ids,
    required int id,
    required String original_title,
    required String original_language,
    required String title,
    required String? backdrop_path,
    required double popularity,
    required int vote_count,
    required bool video,
    required double vote_average,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
