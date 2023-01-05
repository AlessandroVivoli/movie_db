import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_with_media_type.freezed.dart';
part 'movie_with_media_type.g.dart';

@freezed
class MovieWithMediaType with _$MovieWithMediaType {
  const factory MovieWithMediaType({
    required String? posterPath,
    required bool adult,
    required String overview,
    required String releaseDate,
    required String originalTitle,
    required List<int> genreIds,
    required int id,
    required String mediaType,
    required String originalLanguage,
    required String title,
    required String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
  }) = _MovieWithMediaType;

  factory MovieWithMediaType.fromJson(Map<String, Object?> json) =>
      _$MovieWithMediaTypeFromJson(json);
}
