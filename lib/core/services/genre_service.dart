import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db/core/models/genre/genre.dart';

class GenreService {
  static Future<List<Genre>?> getGenres() async {
    try {
      Response<dynamic> response = await Dio().get(
        '${dotenv.env['BASE_URL']}/genre/movie/list',
        queryParameters: {
          'api_key': dotenv.env['TMDB_API_KEY'],
          'language': 'en-US'
        },
        options: Options(
          method: 'GET',
          contentType: 'application/json',
        ),
      );

      final responseBody = List<Map<String, dynamic>>.from(
        Map<String, dynamic>.from(response.data)['genres'],
      );

      List<Genre> data = (responseBody).map(Genre.fromJson).toList();

      return data;
    } catch (e) {
      return null;
    }
  }
}
