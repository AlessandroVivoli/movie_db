import 'package:dio/dio.dart';

import '../interfaces/i_auth_service.dart';

class AuthService implements IAuthService {
  final Dio _dio;

  const AuthService(Dio dio) : _dio = dio;

  @override
  Future<String> login({
    required String username,
    required String password,
  }) async {
    return _dio.get('/authentication/token/new').then(
          (res) => _dio.post(
            '/authentication/token/validate_with_login',
            data: {
              'username': username,
              'password': password,
              'request_token': res.data['request_token'],
            },
          ).then(
            (res) => _dio.post(
              '/authentication/session/new',
              data: {
                'request_token': res.data['request_token'],
              },
            ).then(
              (res) => res.data['session_id'],
            ),
          ),
        );
  }

  @override
  Future<bool> logout({required String sessionId}) {
    return _dio.delete(
      '/authentication/session',
      data: {
        'session_id': sessionId,
      },
    ).then((res) => res.data['success']);
  }
}
