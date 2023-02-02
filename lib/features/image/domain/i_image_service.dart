import 'image_model.dart';
import 'movie_images.dart';

abstract class IImageService {
  /// Returns the image url if [path] is not null.
  ///
  /// [path] is the api image path. [size] can be any \
  /// of the enums: `BackdropSizes`, `LogoSizes`, `PosterSizes`,
  /// `ProfileSizes`
  String? getImageUrl({required String size, required String? path});

  /// Returns [MovieImages] future using the provided movie [id].
  Future<MovieImages> getMovieImages({required int id});

  /// Returns [List] of [ImageModel] future using the provided person [id].
  Future<List<ImageModel>> getPersonImages({required int id});
}
