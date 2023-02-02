import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie.dart';
import '../domain/movie_arguments.dart';
import 'movie_service_provider.dart';

part 'get_movies_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Movie>> getMovies(GetMoviesRef ref, MovieArguments args) {
  return ref.watch(movieServiceProvider).getMovies(
        withGenres: args.withGenres,
        sortBy: args.sortBy,
        includeAdult: args.includeAdult,
      );
}
