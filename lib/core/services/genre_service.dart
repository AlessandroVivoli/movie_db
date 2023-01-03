import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db/core/models/genre/genre.dart';

class GenreService {
  static Future<List<Genre>?> getGenres() async {
    try {
      Response<dynamic> response = await Dio().fetch(
        RequestOptions(
          path: '/genre/movie/list',
          baseUrl: dotenv.env['BASE_URL'],
          queryParameters: {
            'api_key': dotenv.env['TMDB_API_KEY'],
            'language': 'en-US'
          },
        ),
      );

      List<Genre> data = (response.data as List<Map<String, Object?>>)
          .map((json) => Genre.fromJson(json))
          .toList();

      return data;
    } on DioError {
      return null;
    }
  }
}
