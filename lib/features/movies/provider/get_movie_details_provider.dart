import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie_details.dart';
import 'movie_service_provider.dart';

part 'get_movie_details_provider.g.dart';

@riverpod
Future<MovieDetails> getMovieDetails(GetMovieDetailsRef ref, int movieId) {
  return ref.watch(movieServiceProvider).getMovieDetails(id: movieId);
}
