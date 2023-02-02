import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'movie_images.freezed.dart';
part 'movie_images.g.dart';

@freezed
class MovieImages with _$MovieImages {
  const factory MovieImages({
    required List<ImageModel> backdrops,
    required List<ImageModel> posters,
  }) = _MovieImages;

  factory MovieImages.fromJson(Map<String, Object?> json) =>
      _$MovieImagesFromJson(json);
}
