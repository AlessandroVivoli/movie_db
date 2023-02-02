import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie.dart';
import 'movie_service_provider.dart';

part 'get_similar_movies_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Movie>> getSimilarMovies(GetSimilarMoviesRef ref, int movieId) {
  return ref.read(movieServiceProvider).getSimilarMovies(id: movieId);
}
