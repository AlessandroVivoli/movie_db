import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants.dart';
import '../interfaces/i_movie_service.dart';
import '../models/movie/account_movie_arguments.dart';
import '../models/movie/account_state/movie_account_state.dart';
import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
import '../models/movie/movie_arguments.dart';
import '../models/movie/movie_list.dart';
import '../services/movie_service.dart';
import 'dio_provider.dart';
import 'local_storage_provider.dart';

final movieServiceProvider = Provider<IMovieService>(
  (ref) => MovieService(ref.watch(dioProvider)),
);

typedef GetTrendingMoviesProvider
    = FutureProviderFamily<List<Movie>, TimeWindow>;

final getTrendingMoviesProvider = GetTrendingMoviesProvider((ref, timeWindow) {
  return ref
      .watch(movieServiceProvider)
      .getTrendingMovies(timeWindow: timeWindow);
});

final getTopRatedMoviesProvider = FutureProvider(
  (ref) => ref.watch(movieServiceProvider).getTopRatedMovies(),
);

typedef GetMoviesProvider = FutureProviderFamily<List<Movie>, MovieArguments>;

final getMoviesProvider = GetMoviesProvider(
    (ref, arguments) => ref.watch(movieServiceProvider).getMovies(
          withGenres: arguments.withGenres,
          sortBy: arguments.sortBy,
          includeAdult: arguments.includeAdult,
        ));

typedef GetSimilarMoviesProvider = FutureProviderFamily<List<Movie>, int>;

final getSimilarMoviesProvider = GetSimilarMoviesProvider((ref, movieId) {
  return ref.watch(movieServiceProvider).getSimilarMovies(id: movieId);
});

typedef GetMovieDetailsProvider = FutureProviderFamily<MovieDetails, int>;

final getMovieDetailsProvider = GetMovieDetailsProvider((ref, movieId) async {
  final movieService = ref.watch(movieServiceProvider);

  return _getMovieState(ref, movieService, movieId).then((movieState) {
    return movieService
        .getMovieDetails(id: movieId)
        .then((movieDetails) => movieDetails.copyWith(state: movieState));
  });
});

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

final getPersonCreditsProvider = GetPersonCreditsProvider((ref, personId) {
  return ref.watch(movieServiceProvider).getPersonCredits(personId: personId);
});

typedef GetFavoriteMoviesProvider
    = FutureProviderFamily<MovieListModel, AccountMovieArguments>;

final getFavoriteMoviesProvider = GetFavoriteMoviesProvider(
    (ref, args) => ref.watch(movieServiceProvider).getFavoriteMovies(
          accountId: args.accountId,
          sessionId: args.sessionId,
          page: args.page,
        ));

typedef GetRatedMoviesProvider
    = FutureProviderFamily<MovieListModel, AccountMovieArguments>;

final getRatedMoviesProvider = GetRatedMoviesProvider(
    (ref, args) => ref.watch(movieServiceProvider).getRatedMovies(
          accountId: args.accountId,
          sessionId: args.sessionId,
          page: args.page,
        ));

typedef GetMovieWatchlistProvider
    = FutureProviderFamily<MovieListModel, AccountMovieArguments>;

final getMovieWatchlistProvider = GetMovieWatchlistProvider(
    (ref, args) => ref.watch(movieServiceProvider).getMovieWatchlist(
          accountId: args.accountId,
          sessionId: args.sessionId,
          page: args.page,
        ));
