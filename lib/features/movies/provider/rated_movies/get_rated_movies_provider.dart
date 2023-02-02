import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/movie_list.dart';
import '../../domain/user_movie_arguments.dart';
import '../movie_service_provider.dart';

typedef GetRatedMoviesProvider
    = FutureProviderFamily<MovieListModel, UserMovieArguments>;

final getRatedMoviesProvider = GetRatedMoviesProvider(
  name: 'GetRatedMoviesProvider',
  (ref, args) => ref.watch(movieServiceProvider).getRatedMovies(
        accountId: args.user.accountDetails.id,
        sessionId: args.user.sessionId,
        page: args.page,
      ),
);
