import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_with_media_type.freezed.dart';
part 'tv_with_media_type.g.dart';

@freezed
class TVWithMediaType with _$TVWithMediaType {
  const factory TVWithMediaType({
    required String? posterPath,
    required double popularity,
    required int id,
    required String overview,
    required String? backdropPath,
    required double voteAverage,
    required String mediaType,
    required String firstAirDate,
    required List<String> originCountry,
    required List<int> genreIds,
    required String originalLanguage,
    required int voteCount,
    required String name,
    required String originalName,
  }) = _TVWithMediaType;

  factory TVWithMediaType.fromJson(Map<String, Object?> json) =>
      _$TVWithMediaTypeFromJson(json);
}
