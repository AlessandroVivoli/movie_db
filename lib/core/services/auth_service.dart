import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loggy/loggy.dart';

import '../interfaces/i_auth_service.dart';

class AuthService implements IAuthService {
  final Dio _dio;

  const AuthService(Dio dio) : _dio = dio;

  @override
  Future<String?> login({
    required String username,
    required String password,
  }) async {
    try {
      final requestToken = await _dio
          .get('/authentication/token/new')
          .then<String>((res) => res.data['request_token']);

      final validatedToken = await _dio.post(
        '/authentication/token/validate_with_login',
        data: {
          'username': username,
          'password': password,
          'request_token': requestToken,
        },
      ).then<String>((res) => res.data['request_token']);

      final sessionId = await _dio.post(
        '/authentication/session/new',
        data: {
          'request_token': validatedToken,
        },
      ).then<String>((res) => res.data['session_id']);

      return sessionId;
    } on DioError catch (e) {
      logError(e.message, e.error, e.stackTrace);

      debugPrint(e.response?.data['status_message']);

      return Future.error(e);
    }
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
