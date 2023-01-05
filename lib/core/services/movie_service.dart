import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/extensions.dart';
import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
import '../providers/dio_provider.dart';

class MovieService {
  static Future<List<Movie>> getTrendingMovies({
    List<int>? withGenres,
    String timeWindow = 'week',
  }) async {
    try {
      Response<dynamic> response = await DioProvider.dio.get(
        '/trending/movie/$timeWindow',
      );

      final rawData = List<Map<String, dynamic>>.from(
        Map<String, dynamic>.from(response.data)['results'],
      );

      var data = rawData.map(Movie.fromJson).toList();

      if (withGenres != null) {
        data = data
            .where((movie) => movie.genreIds.containsAny(withGenres))
            .toList();
      }

      return data;
    } on DioError catch (e) {
      debugPrint(e.message);
      return List.empty();
    }
  }

  static Future<List<Movie>> getMovies({
    List<int>? withGenres,
    String? sortBy,
  }) async {
    try {
      Response<dynamic> response = await DioProvider.dio.get(
        '/discover/movie',
        queryParameters: {
          'sort_by': sortBy,
          'with_genres': withGenres?.join(','),
        },
      );

      final rawData = List<Map<String, dynamic>>.from(
        Map<String, dynamic>.from(response.data)['results'],
      );

      final data = rawData.map(Movie.fromJson).toList();

      return data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  static Future<MovieDetails> getMovieDetails({
    required int id,
  }) async {
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

      MovieDetails data = MovieDetails.fromJson(responseBody);

      return data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
