import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie.dart';
import '../domain/sort_by.dart';
import 'movie_service_provider.dart';

part 'get_movies_provider.g.dart';

@riverpod
Future<List<Movie>> getMovies(
  GetMoviesRef ref, {
  List<int>? withGenres,
  SortBy sortBy = SortBy.popularityDesc,
  bool includeAdult = false,
}) {
  return ref.watch(movieServiceProvider).getMovies(
        withGenres: withGenres,
        sortBy: sortBy,
        includeAdult: includeAdult,
      );
}
