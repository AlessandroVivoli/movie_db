import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/interceptors/query_interceptor.dart';

class DioProvider {
  static Dio? _dio;

  static Dio _init() {
    return Dio(
      BaseOptions(baseUrl: dotenv.env['BASE_URL']!),
    )..interceptors.addAll(
        [
          QueryInterceptor(),
          if (!kDebugMode) PrettyDioLogger(),
        ],
      );
  }

  static Dio get dio {
    _dio ??= _init();

    return _dio!;
  }
}
