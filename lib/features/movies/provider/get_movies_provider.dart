import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../media/domain/media_arguments.dart';
import '../domain/movie.dart';
import 'movie_service_provider.dart';

part 'get_movies_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Movie>> getMovies(GetMoviesRef ref, MediaArguments args) {
  return ref.watch(movieServiceProvider).getMovies(
        withGenres: args.withGenres,
        sortBy: args.sortBy,
        includeAdult: args.includeAdult,
      );
}
