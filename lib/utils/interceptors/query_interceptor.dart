import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QueryInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'api_key': dotenv.env['TMDB_API_KEY'],
      'language': 'en-US',
    });

    super.onRequest(options, handler);
  }
}
