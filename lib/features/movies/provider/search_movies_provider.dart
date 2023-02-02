import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie_list.dart';
import 'movie_service_provider.dart';

part 'search_movies_provider.g.dart';

@riverpod
Future<MovieListModel> searchMovies(
  SearchMoviesRef ref, {
  required String query,
  bool includeAdult = false,
  int page = 1,
}) async {
  return ref
      .watch(movieServiceProvider)
      .searchMovies(query: query, includeAdult: includeAdult, page: page);
}
