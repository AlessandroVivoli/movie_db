import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/exceptions.dart';
import '../../utils/interceptors/query_interceptor.dart';

class DioProvider {
  static Dio? _dio;

  static void init() {
    if (_dio != null) {
      throw DioProviderException('Dio is already initialized');
    }

    _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!));

    _dio!.interceptors.add(QueryInterceptor());
  }

  static Dio get dio {
    if (_dio == null) {
      throw DioProviderException('Dio is not initialized');
    }

    return _dio!;
  }
}
