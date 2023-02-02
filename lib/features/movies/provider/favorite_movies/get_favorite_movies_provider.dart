import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/user.dart';
import '../../domain/movie_list.dart';
import '../movie_service_provider.dart';

part 'get_favorite_movies_provider.g.dart';

@riverpod
Future<MovieListModel> getFavoriteMovies(
  GetFavoriteMoviesRef ref, {
  required User user,
  int page = 1,
}) {
  return ref.watch(movieServiceProvider).getFavoriteMovies(
        user: user,
        page: page,
      );
}