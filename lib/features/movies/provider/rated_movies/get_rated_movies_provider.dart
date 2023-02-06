import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/user.dart';
import '../../domain/movie_list.dart';
import '../movie_service_provider.dart';

part 'get_rated_movies_provider.g.dart';

@riverpod
Future<MovieListModel> getRatedMovies(
  GetRatedMoviesRef ref, {
  required User user,
  int page = 1,
}) {
  return ref.read(movieServiceProvider).getRatedMovies(
        user: user,
        page: page,
      );
}
