import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../time_window/domain/time_window.dart';
import '../domain/movie.dart';
import 'movie_service_provider.dart';

part 'get_trending_movies_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Movie>> getTrendingMovies(
  GetTrendingMoviesRef ref,
  String timeWindow,
) {
  return ref
      .read(movieServiceProvider)
      .getTrendingMovies(timeWindow: timeWindow);
}
