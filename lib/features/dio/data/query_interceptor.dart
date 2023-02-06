import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QueryInterceptor extends Interceptor {
  final Locale locale;

  QueryInterceptor({this.locale = const Locale('en', 'US')});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final language =
        (locale.languageCode == 'hr' && options.path == '/genre/movie/list')
            ? const Locale('en')
            : locale;

    options.queryParameters.addAll({
      'api_key': dotenv.get('TMDB_API_KEY'),
      'language': language.languageCode,
    });

    super.onRequest(options, handler);
  }
}
