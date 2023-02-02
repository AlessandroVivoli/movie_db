import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/movie_list.dart';
import '../../domain/user_movie_arguments.dart';
import '../movie_service_provider.dart';

typedef GetMovieWatchlistProvider
    = FutureProviderFamily<MovieListModel, UserMovieArguments>;

final getMovieWatchlistProvider = GetMovieWatchlistProvider(
  name: 'GetMovieWatchlistProvider',
  (ref, args) => ref.watch(movieServiceProvider).getMovieWatchlist(
        accountId: args.user.accountDetails.id,
        sessionId: args.user.sessionId,
        page: args.page,
      ),
);
