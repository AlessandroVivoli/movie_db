import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

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

final getTrendingMoviesProvider =
    FutureProvider.family<List<Movie>, TimeWindow>((ref, timeWindow) => ref
        .watch(movieServiceProvider)
        .getTrendingMovies(timeWindow: timeWindow)
        .then(
          (value) => value,
          onError: (err) => logError(
            'Could not get trending movies.',
            err.error,
            err.stackTrace,
          ),
        ));

final getTopRatedMoviesProvider = FutureProvider(
  (ref) => ref.watch(movieServiceProvider).getTopRatedMovies().then(
        (value) => value,
        onError: (err) => logError(
          'Could not get top rated movies.',
          err.error,
          err.stackTrace,
        ),
      ),
);

final getMoviesProvider =
    FutureProvider.family<List<Movie>, MovieArguments>((ref, arguments) => ref
        .watch(movieServiceProvider)
        .getMovies(
          withGenres: arguments.withGenres,
          sortBy: arguments.sortBy,
          includeAdult: arguments.includeAdult,
        )
        .then(
          (value) => value,
          onError: (err) => logError(
            'Could not get movies.',
            err.error,
            err.stackTrace,
          ),
        ));

final getSimilarMoviesProvider = FutureProvider.family<List<Movie>, int>(
  (ref, movieId) =>
      ref.watch(movieServiceProvider).getSimilarMovies(id: movieId).then(
            (value) => value,
            onError: (err) => logError(
              'Could not get similar movies.',
              err.error,
              err.stackTrace,
            ),
          ),
);

final getMovieDetailsProvider = FutureProvider.family<MovieDetails, int>(
  (ref, movieId) async {
    final movieService = ref.watch(movieServiceProvider);
    final sessionId = ref.watch(localStorageProvider).getSessionId();

    MovieAccountState? state;

    if (sessionId != null) {
      state = await movieService.getAccountMovieState(
        id: movieId,
        sessionId: sessionId,
      );
    }

    return movieService.getMovieDetails(id: movieId).then(
          (details) => details.copyWith(
            state: state,
          ),
          onError: (err) => logError(
            'Could not get movie details.',
            err.error,
            err.stackTrace,
          ),
        );
  },
);

final getPersonCreditsProvider = FutureProvider.family<List<Movie>, int>((ref,
        personId) =>
    ref.watch(movieServiceProvider).getPersonCredits(personId: personId).then(
          (value) => value,
          onError: (err) => logError(
            'Could not get movie credits.',
            err.error,
            err.stackTrace,
          ),
        ));

final getFavoriteMoviesProvider =
    FutureProvider.family<MovieListModel, AccountMovieArguments>(
  (ref, args) => ref
      .watch(movieServiceProvider)
      .getFavoriteMovies(
        accountId: args.accountId,
        sessionId: args.sessionId,
        page: args.page,
      )
      .then(
        (value) => value,
        onError: (err) => logError(
          'Could not get favorite movies.',
          err.error,
          err.stackTrace,
        ),
      ),
);

final getRatedMoviesProvider =
    FutureProvider.family<MovieListModel, AccountMovieArguments>(
  (ref, args) => ref
      .watch(movieServiceProvider)
      .getRatedMovies(
        accountId: args.accountId,
        sessionId: args.sessionId,
        page: args.page,
      )
      .then(
        (value) => value,
        onError: (err) => logError(
          'Could not get rated movies.',
          err.error,
          err.stackTrace,
        ),
      ),
);

final getMovieWatchlistProvider =
    FutureProvider.family<MovieListModel, AccountMovieArguments>(
  (ref, args) => ref
      .watch(movieServiceProvider)
      .getMovieWatchlist(
        accountId: args.accountId,
        sessionId: args.sessionId,
        page: args.page,
      )
      .then(
        (value) => value,
        onError: (err) => logError(
          'Could not get movie watchlist.',
          err.error,
          err.stackTrace,
        ),
      ),
);
