import 'package:dio/dio.dart';

import '../interfaces/i_account_service.dart';
import '../models/account/account_details.dart';

class AccountService implements IAccountService {
  final Dio _dio;

  const AccountService(Dio dio) : _dio = dio;

  @override
  Future<AccountDetails> getAccountDetails({required String sessionId}) {
    return _dio
        .get(
          '/account',
          queryParameters: {
            'session_id': sessionId,
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(AccountDetails.fromJson);
  }

  @override
  Future<int> markMovieAsFavorite({
    required int accountId,
    required int movieId,
    required String sessionId,
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
          queryParameters: {
            'session_id': sessionId,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  @override
  Future<int> addMovieToWatchList({
    required int accountId,
    required int movieId,
    required String sessionId,
    required bool watchlist,
  }) {
    return _dio.post(
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
