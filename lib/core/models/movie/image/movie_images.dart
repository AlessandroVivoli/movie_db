import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_image.dart';

part 'movie_images.freezed.dart';
part 'movie_images.g.dart';

@freezed
class MovieImages with _$MovieImages {
  const factory MovieImages({
    required List<MovieImage> backdrops,
    required List<MovieImage> posters,
  }) = _MovieImages;

  factory MovieImages.fromJson(Map<String, Object?> json) =>
      _$MovieImagesFromJson(json);
}
