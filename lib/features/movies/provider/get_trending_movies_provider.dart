import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../time_window/domain/time_window.dart';
import '../domain/movie.dart';
import 'movie_service_provider.dart';

part 'get_trending_movies_provider.g.dart';

@riverpod
Future<List<Movie>> getTrendingMovies(
  GetTrendingMoviesRef ref,
  TimeWindow timeWindow,
) {
  return ref
      .watch(movieServiceProvider)
      .getTrendingMovies(timeWindow: timeWindow);
}
