import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/interceptors/query_interceptor.dart';

final dioProvider = Provider((ref) {
  return Dio(
    BaseOptions(baseUrl: dotenv.get('BASE_URL')),
  )..interceptors.addAll(
      [
        QueryInterceptor(),
        if (!kDebugMode) PrettyDioLogger(),
      ],
    );
});
