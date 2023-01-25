import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import '../interfaces/i_movie_service.dart';
import '../models/movie/account_state/movie_account_state.dart';
import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
import '../models/movie/movie_list.dart';
import '../providers/dio_provider.dart';

class MovieService implements IMovieService {
  @override
  Future<List<Movie>> getTrendingMovies({
    TimeWindow timeWindow = TimeWindow.week,
  }) {
    return DioProvider.dio
        .get('/trending/movie/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    return DioProvider.dio
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
    return DioProvider.dio
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
    return DioProvider.dio
        .get('/movie/$id')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieDetails.fromJson);
  }

  @override
  Future<List<Movie>> getSimilarMovies({required int id}) {
    return DioProvider.dio
        .get('/movie/$id/similar')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  @override
  Future<List<Movie>> getPersonCredits({required int personId}) {
    return DioProvider.dio
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
    return DioProvider.dio
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
    return DioProvider.dio
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
    return DioProvider.dio
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
    return DioProvider.dio
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
  Future<int> rateMovie({
    required int id,
    required String sessionId,
    required double rating,
  }) {
    return DioProvider.dio
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
  Future<int> deleteRating({
    required int id,
    required String sessionId,
  }) {
    return DioProvider.dio
        .delete(
          '/movie/$id/rating',
          queryParameters: {
            'session_id': sessionId,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }
}
