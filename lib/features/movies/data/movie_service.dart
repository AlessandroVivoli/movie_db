import 'package:dio/dio.dart';

import '../../time_window/domain/time_window.dart';
import '../domain/account_state/movie_account_state.dart';
import '../domain/i_movie_service.dart';
import '../domain/movie.dart';
import '../domain/movie_details.dart';
import '../domain/movie_list.dart';
import '../domain/sort_by.dart';

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
    bool? includeAdult,
  }) {
    return _dio
        .get(
          '/discover/movie',
          queryParameters: {
            'sort_by': '$sortBy',
            'with_genres': withGenres?.join(','),
            'include_adult': includeAdult ?? false,
          },
        )
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<MovieDetails> getMovieDetails({required int id}) {
    return _dio
        .get('/movie/$id')
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
  Future<List<Movie>> getPersonCredits({required int personId}) {
    return _dio
        .get('/person/$personId/movie_credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<MovieAccountState> getAccountMovieState({
    required int id,
    required String sessionId,
  }) {
    return _dio
        .get(
          '/movie/$id/account_states',
          queryParameters: {
            'session_id': sessionId,
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieAccountState.fromJson);
  }

  @override
  Future<MovieListModel> getFavoriteMovies({
    required int accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _dio
        .get(
          '/account/$accountId/favorite/movies',
          queryParameters: {
            'session_id': sessionId,
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieListModel.fromJson);
  }

  @override
  Future<MovieListModel> getMovieWatchlist({
    required int accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _dio
        .get(
          '/account/$accountId/watchlist/movies',
          queryParameters: {
            'session_id': sessionId,
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieListModel.fromJson);
  }

  @override
  Future<MovieListModel> getRatedMovies({
    required int accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _dio
        .get(
          '/account/$accountId/rated/movies',
          queryParameters: {
            'session_id': sessionId,
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieListModel.fromJson);
  }

  @override
  Future<void> rateMovie({
    required int id,
    required String sessionId,
    required double rating,
  }) {
    return _dio
        .post(
          '/movie/$id/rating',
          queryParameters: {
            'session_id': sessionId,
          },
          data: {
            'value': rating,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  @override
  Future<void> deleteRating({
    required int id,
    required String sessionId,
  }) {
    return _dio
        .delete(
          '/movie/$id/rating',
          queryParameters: {
            'session_id': sessionId,
          },
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
