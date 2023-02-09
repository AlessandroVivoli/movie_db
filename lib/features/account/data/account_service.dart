import 'package:dio/dio.dart';

import '../../movies/domain/movie_list.dart';
import '../../tv_shows/domain/tv_list_model.dart';
import '../domain/i_account_service.dart';

class AccountService implements IAccountService {
  final Dio _dio;

  const AccountService(Dio dio) : _dio = dio;

  @override
  Future<int> markMovieAsFavorite({
    required int accountId,
    required int movieId,
    required bool favorite,
  }) {
    return _dio
        .post(
          '/account/$accountId/favorite',
          data: {
            'media_type': 'movie',
            'media_id': movieId,
            'favorite': favorite,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  @override
  Future<void> addToWatchlist({
    required int accountId,
    required int mediaId,
    required String mediaType,
    required bool watchlist,
  }) {
    return _dio.post(
      '/account/$accountId/watchlist',
      data: {
        'media_type': mediaType,
        'media_id': mediaId,
        'watchlist': watchlist,
      },
    ).then((res) => res.data['status_code']);
  }

  @override
  Future<MovieListModel> getFavoriteMovies({
    required int accountId,
    int page = 1,
  }) {
    return _dio
        .get(
          '/account/$accountId/favorite/movies',
          queryParameters: {
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
    int page = 1,
  }) {
    return _dio
        .get(
          '/account/$accountId/watchlist/movies',
          queryParameters: {
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
    int page = 1,
  }) {
    return _dio
        .get(
          '/account/$accountId/rated/movies',
          queryParameters: {
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieListModel.fromJson);
  }

  @override
  Future<TVListModel> getTVWatchlist({required int accountId, int page = 1}) {
    return _dio
        .get(
          '/account/$accountId/watchlist/tv',
          queryParameters: {
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(TVListModel.fromJson);
  }
}
