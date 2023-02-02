import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie.dart';
import 'movie_service_provider.dart';

part 'get_top_rated_movies_provider.g.dart';

@riverpod
Future<List<Movie>> getTopRatedMovies(GetTopRatedMoviesRef ref) {
  return ref.watch(movieServiceProvider).getTopRatedMovies();
}
