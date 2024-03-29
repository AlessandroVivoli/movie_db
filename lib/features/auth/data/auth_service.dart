import 'package:dio/dio.dart';

import '../../account/domain/account_details.dart';
import '../domain/i_auth_service.dart';

class AuthService implements IAuthService {
  final Dio _dio;

  AuthService(this._dio);

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
  Future<String> login({
    required String username,
    required String password,
  }) async {
    return _dio
        .get('/authentication/token/new')
        .then(
          (res) => _dio.post(
            '/authentication/token/validate_with_login',
            data: {
              'username': username,
              'password': password,
              'request_token': res.data['request_token'],
            },
          ),
        )
        .then(
          (res) => _dio.post(
            '/authentication/session/new',
            data: {
              'request_token': res.data['request_token'],
            },
          ),
        )
        .then((res) => res.data['session_id']);
  }

  @override
  Future<void> logout({required String sessionId}) {
    return _dio.delete(
      '/authentication/session',
      data: {
        'session_id': sessionId,
      },
    );
  }
}
