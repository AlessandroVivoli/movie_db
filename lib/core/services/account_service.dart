import 'package:dio/dio.dart';

import '../models/account/account_details.dart';
import '../providers/dio_provider.dart';

class AccountService {
  static Future<AccountDetails> getAccountDetails({required String sessionId}) {
    return DioProvider.dio
        .get(
          '/account',
          queryParameters: {
            'session_id': sessionId,
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(AccountDetails.fromJson);
  }

  static Future<int> markMovieAsFavorite({
    required int accountId,
    required int movieId,
    required String sessionId,
    required bool favorite,
  }) {
    return DioProvider.dio
        .post(
          '/account/$accountId/favorite',
          data: {
            'media_type': 'movie',
            'media_id': movieId,
            'favorite': favorite,
          },
          queryParameters: {
            'session_id': sessionId,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  static Future<int> addMovieToWatchList({
    required int accountId,
    required int movieId,
    required String sessionId,
    required bool watchlist,
  }) {
    return DioProvider.dio.post(
      '/account/$accountId/watchlist',
      queryParameters: {
        'session_id': sessionId,
      },
      data: {
        'media_type': 'movie',
        'media_id': movieId,
        'watchlist': watchlist,
      },
    ).then((res) => res.data['status_code']);
  }
}