import 'package:dio/dio.dart';

import '../interfaces/i_account_service.dart';
import '../models/account/account_details.dart';
import '../models/user/user.dart';

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
    required User user,
    required int movieId,
    required bool favorite,
  }) {
    return _dio
        .post(
          '/account/${user.accountDetails.id}/favorite',
          data: {
            'media_type': 'movie',
            'media_id': movieId,
            'favorite': favorite,
          },
          queryParameters: {
            'session_id': user.sessionId,
          },
          options: Options(contentType: 'application/json;charset=utf-8'),
        )
        .then((res) => res.data['status_code']);
  }

  @override
  Future<int> addMovieToWatchList({
    required User user,
    required int movieId,
    required bool watchlist,
  }) {
    return _dio.post(
      '/account/${user.accountDetails.id}/watchlist',
      queryParameters: {
        'session_id': user.sessionId,
      },
      data: {
        'media_type': 'movie',
        'media_id': movieId,
        'watchlist': watchlist,
      },
    ).then((res) => res.data['status_code']);
  }
}
