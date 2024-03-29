import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../movies/domain/movie_list.dart';
import '../account_service_provider.dart';

part 'get_favorite_movies_provider.g.dart';

@riverpod
Future<MovieListModel> getFavoriteMovies(
  GetFavoriteMoviesRef ref, {
  int page = 1,
}) {
  final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user)!;

  return ref.read(accountServiceProvider).getFavoriteMovies(
        accountId: user.accountDetails.id,
        page: page,
      );
}
