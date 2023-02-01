import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/movie/movie_list.dart';
import '../../../models/movie/user_movie_arguments.dart';
import '../movie_service_provider.dart';

typedef GetFavoriteMoviesProvider
    = FutureProviderFamily<MovieListModel, UserMovieArguments>;

final getFavoriteMoviesProvider = GetFavoriteMoviesProvider(
  name: 'GetFavoriteMoviesProvider',
  (ref, args) => ref.watch(movieServiceProvider).getFavoriteMovies(
        accountId: args.user.accountDetails.id,
        sessionId: args.user.sessionId,
        page: args.page,
      ),
);
