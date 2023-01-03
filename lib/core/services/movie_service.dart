import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db/core/models/movie/details/movie_details.dart';
import 'package:movie_db/core/models/movie/movie.dart';

class MovieService {
  static Future<List<Movie>?> getPopularMovies({List<int>? withGenres}) async {
    try {
      Response<dynamic> response = await Dio().fetch(RequestOptions(
          path: 'https://api.themoviedb.org/3/discover/movie',
          queryParameters: {
            'api_key': dotenv.env['TMDB_API_KEY'],
            'language': 'en-US',
            'sort_by': 'popularity.desc',
            'with_genres': withGenres?.join(','),
          }));

      List<Movie> data = (response.data as List<Map<String, Object?>>)
          .map((json) => Movie.fromJson(json))
          .toList();

      return data;
    } on DioError {
      return null;
    }
  }

  static Future<MovieDetails?> getMovieDetails({required int id}) async {
    try {
      Response<dynamic> response = await Dio().fetch(RequestOptions(
        path: 'http://api.themoviedb.org/3/movie/$id',
        queryParameters: {
          'api_key': dotenv.env['TMDB_API_KEY'],
          'language': 'en_US',
        },
      ));

      MovieDetails data = MovieDetails.fromJson(response.data);

      return data;
    } on DioError {
      return null;
    }
  }
}
