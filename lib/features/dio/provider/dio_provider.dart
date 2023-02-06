import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../localization/provider/locale_state_provider.dart';
import '../data/query_interceptor.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final locale = ref.watch(localeStateProvider);

  return Dio(
    BaseOptions(baseUrl: dotenv.get('BASE_URL')),
  )..interceptors.addAll(
      [
        QueryInterceptor(locale: locale),
        if (!kDebugMode) PrettyDioLogger(),
      ],
    );
}
