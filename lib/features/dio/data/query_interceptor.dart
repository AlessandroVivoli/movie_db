import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final _ignoreLanguages = [
  'hr',
];

final _ignorePaths = [
  '/genre/movie/list',
  '/genre/tv/list',
];

class QueryInterceptor extends Interceptor {
  final Locale locale;
  final String? sessionId;

  QueryInterceptor({this.locale = const Locale('en', 'US'), this.sessionId});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final containsLanguage = _ignoreLanguages.contains(locale.languageCode);
    final containsPath = _ignorePaths.contains(options.path);

    final language =
        (containsLanguage && containsPath) ? const Locale('en') : locale;

    options.queryParameters.addAll({
      'api_key': dotenv.get('TMDB_API_KEY'),
      'language': language.languageCode,
      'session_id': sessionId,
    });

    super.onRequest(options, handler);
  }
}
