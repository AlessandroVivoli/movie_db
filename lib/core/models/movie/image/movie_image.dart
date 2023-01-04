import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_image.freezed.dart';
part 'movie_image.g.dart';

@freezed
class MovieImage with _$MovieImage {
  const factory MovieImage({
    required double aspectRatio,
    required String filePath,
    required int height,
    required String? iso_639_1,
    required int voteAverage,
    required int voteCount,
    required int width,
  }) = _MovieImage;

  factory MovieImage.fromJson(Map<String, Object?> json) =>
      _$MovieImageFromJson(json);
}
