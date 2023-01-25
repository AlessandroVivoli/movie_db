import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../interfaces/i_image_servicer.dart';
import '../models/image/image_model.dart';
import '../models/movie/image/movie_images.dart';
import '../providers/dio_provider.dart';

class ImageService implements IImageService {
  @override
  String? getImageUrl({required String size, required String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}$size$path';
  }

  @override
  Future<MovieImages> getMovieImages({required int id}) {
    return DioProvider.dio
        .get('/movie/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieImages.fromJson);
  }

  @override
  Future<List<ImageModel>> getPersonImages({required int id}) {
    return DioProvider.dio
        .get('/person/$id/images')
        .then((res) => List<Map<String, Object?>>.from(res.data['profiles']))
        .then((rawList) => rawList.map(ImageModel.fromJson))
        .then((images) => images.toList());
  }
}
