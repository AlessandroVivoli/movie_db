import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/i_image_service.dart';
import '../domain/image_model.dart';
import '../domain/movie_images.dart';

class ImageService implements IImageService {
  final Dio _dio;

  const ImageService(Dio dio) : _dio = dio;

  @override
  String? getImageUrl({required String size, required String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}$size$path';
  }

  @override
  Future<MovieImages> getMovieImages({required int id}) {
    return _dio
        .get('/movie/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieImages.fromJson);
  }

  @override
  Future<List<ImageModel>> getPersonImages({required int id}) {
    return _dio
        .get('/person/$id/images')
        .then((res) => List<Map<String, Object?>>.from(res.data['profiles']))
        .then((rawList) => rawList.map(ImageModel.fromJson))
        .then((images) => images.toList());
  }
}
