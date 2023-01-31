import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../interfaces/i_movie_service.dart';
import '../models/movie/account_state/movie_account_state.dart';
import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
import '../models/movie/movie_arguments.dart';
import '../models/movie/movie_list.dart';
import '../models/movie/movie_user_action_arguments.dart';
import '../models/movie/user_movie_arguments.dart';
import '../services/movie_service.dart';
import '../unions/rate_state.dart';
import 'account_service_provider.dart';
import 'dio_provider.dart';
import 'local_storage_provider.dart';

part 'movie_provider.g.dart';

final movieServiceProvider = Provider<IMovieService>(
  name: 'MovieServiceProvider',
  (ref) => MovieService(ref.watch(dioProvider)),
);

typedef GetTrendingMoviesProvider
    = FutureProviderFamily<List<Movie>, TimeWindow>;

final getTrendingMoviesProvider = GetTrendingMoviesProvider(
  name: 'GetTrendingMoviesProvider',
  (ref, timeWindow) {
    return ref
        .watch(movieServiceProvider)
        .getTrendingMovies(timeWindow: timeWindow);
  },
);

final getTopRatedMoviesProvider = FutureProvider(
  (ref) => ref.watch(movieServiceProvider).getTopRatedMovies(),
);

typedef GetMoviesProvider = FutureProviderFamily<List<Movie>, MovieArguments>;

final getMoviesProvider = GetMoviesProvider(
  name: 'GetMoviesProvider',
  (ref, arguments) => ref.watch(movieServiceProvider).getMovies(
        withGenres: arguments.withGenres,
        sortBy: arguments.sortBy,
        includeAdult: arguments.includeAdult,
      ),
);

typedef GetSimilarMoviesProvider = FutureProviderFamily<List<Movie>, int>;

final getSimilarMoviesProvider = GetSimilarMoviesProvider(
  name: 'GetSimilarMoviesProvider',
  (ref, movieId) {
    return ref.watch(movieServiceProvider).getSimilarMovies(id: movieId);
  },
);

typedef GetMovieDetailsProvider = FutureProviderFamily<MovieDetails, int>;

final getMovieDetailsProvider = GetMovieDetailsProvider(
  name: 'GetMovieDetailsProvider',
  (ref, movieId) async {
    final movieService = ref.watch(movieServiceProvider);

    return _getMovieState(ref, movieService, movieId).then((movieState) {
      return movieService
          .getMovieDetails(id: movieId)
          .then((movieDetails) => movieDetails.copyWith(state: movieState));
    });
  },
);

Future<MovieAccountState?> _getMovieState(
  FutureProviderRef<MovieDetails> ref,
  IMovieService movieService,
  int movieId,
) async {
  final sessionId = ref.watch(localStorageProvider).getSessionId();

  if (sessionId != null) {
    return movieService.getAccountMovieState(id: movieId, sessionId: sessionId);
  }

  return null;
}

typedef GetPersonCreditsProvider = FutureProviderFamily<List<Movie>, int>;

final getPersonCreditsProvider = GetPersonCreditsProvider(
  name: 'GetPersonCreditsProvider',
  (ref, personId) {
    return ref.watch(movieServiceProvider).getPersonCredits(personId: personId);
  },
);

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

typedef AddMovieToFavoritesProvider
    = FutureProviderFamily<void, MovieUserActionArguments>;

final addMovieToFavoritesProvider = AddMovieToFavoritesProvider(
  name: 'AddMovieToFavoritesProvider',
  (ref, args) => ref
      .watch(accountServiceProvider)
      .markMovieAsFavorite(
        user: args.user,
        movieId: args.movieId,
        favorite: args.action,
      )
      .then(
        (_) => _refreshMovies(ref, args.movieId, RefreshType.favorites),
      ),
);

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

class RateMovieNotifier extends AutoDisposeNotifier<RateState> {
  void rateMovie(int movieId, String sessionId, double rating) {
    state = const RateState.loading();

    ref
        .read(movieServiceProvider)
        .rateMovie(
          id: movieId,
          sessionId: sessionId,
          rating: rating,
        )
        .catchError((err) => state = RateState.error(err, err.stackTrace))
        .then((_) {
      _refreshMovies(ref, movieId, RefreshType.rate);
      state = const RateState.completed();
    });
  }

  @override
  RateState build() {
    return const RateState.init();
  }
}

typedef RateMovieProvider
    = AutoDisposeNotifierProvider<RateMovieNotifier, RateState>;

final rateMovieProvider = RateMovieProvider(
  name: 'RateMoviesProvider',
  () => RateMovieNotifier(),
);

class DeleteRatingNotifier extends AutoDisposeNotifier<RateState> {
  void deleteRating(int movieId, String sessionId) {
    state = const RateState.loading();

    ref
        .read(movieServiceProvider)
        .deleteRating(id: movieId, sessionId: sessionId)
        .catchError((err) => state = RateState.error(err, err.stackTrace))
        .then((_) {
      _refreshMovies(ref, movieId, RefreshType.rate);
      state = const RateState.completed();
    });
  }

  @override
  RateState build() {
    return const RateState.init();
  }
}

typedef DeleteRatingProvider
    = AutoDisposeNotifierProvider<DeleteRatingNotifier, RateState>;

final deleteRatingProvider = DeleteRatingProvider(
  name: 'DeleteRatingProvider',
  () => DeleteRatingNotifier(),
);

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

typedef AddMovieToWatchlistProvider
    = FutureProviderFamily<void, MovieUserActionArguments>;

final addMovieToWatchlistProvider = AddMovieToWatchlistProvider(
  name: 'AddMovieToWatchlistProvider',
  (ref, args) => ref
      .watch(accountServiceProvider)
      .addMovieToWatchList(
        user: args.user,
        movieId: args.movieId,
        watchlist: args.action,
      )
      .then((_) => _refreshMovies(ref, args.movieId, RefreshType.watchlist)),
);

dynamic _refreshMovies(Ref ref, int movieId, RefreshType type) {
  switch (type) {
    case RefreshType.favorites:
      ref.invalidate(getFavoriteMoviesProvider);
      ref.invalidate(addMovieToFavoritesProvider);
      break;
    case RefreshType.rate:
      ref.invalidate(getRatedMoviesProvider);
      break;
    case RefreshType.watchlist:
      ref.invalidate(getMovieWatchlistProvider);
      ref.invalidate(addMovieToWatchlistProvider);
      break;
  }

  ref.invalidate(getMovieDetailsProvider(movieId));
}

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
