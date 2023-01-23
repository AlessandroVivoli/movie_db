import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/image/image_model.dart';
import '../models/movie/image/movie_images.dart';
import '../providers/dio_provider.dart';

class ImageService {
  /// Returns the image url if [path] is not null.
  ///
  /// [path] is the api image path. [size] can be any \
  /// of the enums: `BackdropSizes`, `LogoSizes`, `PosterSizes`,
  /// `ProfileSizes`
  static String? getImageUrl({required String size, required String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}$size$path';
  }

  /// Returns [MovieImages] future using the provided movie [id].
  static Future<MovieImages> getMovieImages({required int id}) {
    return DioProvider.dio
        .get('/movie/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieImages.fromJson);
  }

  /// Returns [List] of [ImageModel] future using the provided person [id].
  static Future<List<ImageModel>> getPersonImages({required int id}) {
    return DioProvider.dio
        .get('/person/$id/images')
        .then((res) => List<Map<String, Object?>>.from(res.data['profiles']))
        .then((rawList) => rawList.map(ImageModel.fromJson))
        .then((images) => images.toList());
  }
}
