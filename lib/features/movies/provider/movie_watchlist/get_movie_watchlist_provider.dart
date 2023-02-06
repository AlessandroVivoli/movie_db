import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/user.dart';
import '../../domain/movie_list.dart';
import '../movie_service_provider.dart';

part 'get_movie_watchlist_provider.g.dart';

@riverpod
Future<MovieListModel> getMovieWatchlist(
  GetMovieWatchlistRef ref, {
  required User user,
  int page = 1,
}) {
  return ref.read(movieServiceProvider).getMovieWatchlist(
        user: user,
        page: page,
      );
}
