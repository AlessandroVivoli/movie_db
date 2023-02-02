import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/query_interceptor.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(baseUrl: dotenv.get('BASE_URL')),
  )..interceptors.addAll(
      [
        QueryInterceptor(),
        if (!kDebugMode) PrettyDioLogger(),
      ],
    );
}
