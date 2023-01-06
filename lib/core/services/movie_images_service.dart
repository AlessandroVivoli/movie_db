import '../models/movie/image/movie_images.dart';
import '../providers/dio_provider.dart';

class MovieImagesService {
  static Future<MovieImages> getMovieImages({required int id}) {
    return DioProvider.dio
        .get('/movie/$id/images')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieImages.fromJson);
  }
}
