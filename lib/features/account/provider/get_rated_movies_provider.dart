import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/provider/auth_provider.dart';
import '../../movies/domain/movie_list.dart';
import 'account_service_provider.dart';

part 'get_rated_movies_provider.g.dart';

@riverpod
Future<MovieListModel> getRatedMovies(
  GetRatedMoviesRef ref, {
  int page = 1,
}) {
  final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user)!;

  return ref.read(accountServiceProvider).getRatedMovies(
        user: user,
        page: page,
      );
}
