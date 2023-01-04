import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';

class MovieService {
  static Future<List<Movie>?> getPopularMovies({List<int>? withGenres}) async {
    try {
      Response<dynamic> response = await Dio().get(
        "${dotenv.env['BASE_URL']}/discover/movie",
        queryParameters: {
          'api_key': dotenv.env['TMDB_API_KEY'],
          'language': 'en_US',
          'sort_by': 'popularity.desc',
          'with_genres': withGenres?.join(','),
        },
        options: Options(
          method: 'GET',
          contentType: 'application/json',
        ),
      );

      final rawData = List<Map<String, dynamic>>.from(
        Map<String, dynamic>.from(response.data)['results'],
      );

      final data = rawData.map((json) => Movie.fromJson(json)).toList();

      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<MovieDetails?> getMovieDetails({required int id}) async {
    try {
      Response<dynamic> response = await Dio().get(
        "${dotenv.env['BASE_URL']}/movie/$id",
        queryParameters: {
          'api_key': dotenv.env['TMDB_API_KEY'],
          'language': 'en_US',
        },
        options: Options(
          method: 'GET',
          contentType: 'application/json',
        ),
      );

      final responseBody = Map<String, dynamic>.from(response.data);

      MovieDetails? data = MovieDetails.fromJson(responseBody);

      return data;
    } catch (e) {
      return null;
    }
  }
}
