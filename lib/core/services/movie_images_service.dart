import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie/image/movie_images.dart';

class MovieImagesService {
  static Future<MovieImages?> getMovieImages({required int id}) async {
    try {
      Response<dynamic> response = await Dio().fetch(
        RequestOptions(
          path: '/movie/$id/images',
          baseUrl: dotenv.env['BASE_URL'],
          queryParameters: {
            'api_key': dotenv.env['TMDB_API_KEY'],
            'language': 'en_US'
          },
        ),
      );

      final responseBody = Map<String, dynamic>.from(response.data);

      MovieImages images = MovieImages.fromJson(responseBody);

      return images;
    } catch (e) {
      return null;
    }
  }
}
