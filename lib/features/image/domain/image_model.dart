import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required double aspectRatio,
    required String filePath,
    required int height,
    required String? iso_639_1,
    required double voteAverage,
    required int voteCount,
    required int width,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, Object?> json) =>
      _$ImageModelFromJson(json);
}
