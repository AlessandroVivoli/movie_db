import 'package:dio/dio.dart';

import '../../media/domain/sort_by.dart';
import '../../time_window/domain/time_window.dart';
import '../domain/i_movie_service.dart';
import '../domain/movie.dart';
import '../domain/movie_details.dart';
import '../domain/movie_list.dart';

class MovieService implements IMovieService {
  final Dio _dio;

  const MovieService(Dio dio) : _dio = dio;

  @override
  Future<List<Movie>> getTrendingMovies({
    TimeWindow timeWindow = TimeWindow.week,
  }) {
    return _dio
        .get('/trending/movie/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    return _dio
        .get('/movie/top_rated')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<List<Movie>> getMovies({
    List<int>? withGenres,
    SortBy sortBy = SortBy.popularityDesc,
    bool includeAdult = false,
  }) {
    return _dio
        .get(
          '/discover/movie',
          queryParameters: {
            'sort_by': '$sortBy',
            'with_genres': withGenres?.join(','),
            'include_adult': includeAdult,
          },
        )
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<MovieDetails> getMovieDetails({required int id}) {
    return _dio
        .get(
          '/movie/$id',
          queryParameters: {
            'append_to_response': 'reviews,account_states',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieDetails.fromJson);
  }

  @override
  Future<List<Movie>> getSimilarMovies({required int id}) {
    return _dio
        .get('/movie/$id/similar')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<void> rateMovie({required int id, required double rating}) {
    return _dio
        .post(
          '/movie/$id/rating',
          data: {
            'value': rating,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  @override
  Future<void> deleteRating({required int id}) {
    return _dio
        .delete(
          '/movie/$id/rating',
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  @override
  Future<MovieListModel> searchMovies({
    required String query,
    bool includeAdult = false,
    int page = 1,
  }) {
    return _dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'include_adult': includeAdult,
        'page': page,
      },
    ).then((res) => MovieListModel.fromJson(res.data));
  }
}
