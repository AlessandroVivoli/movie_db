import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../media/domain/media_images.dart';
import '../../movies/domain/backdrop_sizes_enum.dart';
import '../../movies/domain/poster_sizes_enum.dart';
import '../domain/i_tv_image_service.dart';

class TVImageService extends ITVImageService {
  final Dio _dio;

  const TVImageService(Dio dio) : _dio = dio;

  @override
  String? getTVBackdropUrl({required BackdropSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }

  @override
  Future<MediaImages> getTVImages({required int id}) {
    return _dio
        .get('/tv/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MediaImages.fromJson);
  }

  @override
  String? getTVPosterUrl({required PosterSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }
}
