import 'package:freezed_annotation/freezed_annotation.dart';

import '../../image/domain/image_model.dart';

part 'media_images.freezed.dart';
part 'media_images.g.dart';

@freezed
class MediaImages with _$MediaImages {
  const factory MediaImages({
    required int id,
    required List<ImageModel> backdrops,
    required List<ImageModel> posters,
  }) = _MediaImages;

  factory MediaImages.fromJson(Map<String, Object?> json) =>
      _$MediaImagesFromJson(json);
}
