import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../movies/domain/backdrop_sizes_enum.dart';
import '../../movies/domain/poster_sizes_enum.dart';
import '../domain/i_tv_image_service.dart';
import '../domain/tv_images.dart';

class TVImageService extends ITVImageService {
  final Dio _dio;

  const TVImageService(Dio dio) : _dio = dio;

  @override
  String? getTVBackdropUrl({required BackdropSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }

  @override
  Future<TVImages> getTVImages({required int id}) {
    // TODO: implement getTVImages
    throw UnimplementedError();
  }

  @override
  String? getTVPosterUrl({required PosterSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }
}
