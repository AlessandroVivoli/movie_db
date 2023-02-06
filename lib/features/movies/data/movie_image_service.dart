import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/backdrop_sizes_enum.dart';
import '../domain/i_movie_image_service.dart';
import '../domain/movie_images.dart';
import '../domain/poster_sizes_enum.dart';

class MovieImageService extends IMovieImageService {
  final Dio _dio;

  const MovieImageService(Dio dio) : _dio = dio;

  @override
  String? getMovieBackdropUrl({required BackdropSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }

  @override
  String? getMoviePosterUrl({required PosterSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }

  @override
  Future<MovieImages> getMovieImages({required int id}) {
    return _dio
        .get('/movie/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieImages.fromJson);
  }
}
