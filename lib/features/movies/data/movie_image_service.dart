import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../media/domain/i_media_image_service.dart';
import '../../media/domain/media_images.dart';
import '../domain/backdrop_sizes_enum.dart';
import '../domain/poster_sizes_enum.dart';

class MovieImageService extends IMediaImageService {
  final Dio _dio;

  const MovieImageService(Dio dio) : _dio = dio;

  @override
  String? getMediaBackdropUrl({required BackdropSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }

  @override
  String? getMediaPosterUrl({required PosterSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }

  @override
  Future<MediaImages> getMediaImages({required int id}) {
    return _dio
        .get('/movie/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MediaImages.fromJson);
  }
}
