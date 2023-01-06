import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/interceptors/query_interceptor.dart';

class DioProvider {
  static Dio? _dio;

  static Dio _init() {
    return Dio(
      BaseOptions(baseUrl: dotenv.env['BASE_URL']!),
    )..interceptors.add(QueryInterceptor());
  }

  static Dio get dio {
    _dio ??= _init();

    return _dio!;
  }
}
