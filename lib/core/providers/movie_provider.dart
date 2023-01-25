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
import 'session_provider.dart';

final movieServiceProvider = Provider<IMovieService>((ref) => MovieService());

final getTrendingMoviesProvider =
    FutureProvider.family<List<Movie>, TimeWindow>((ref, timeWindow) => ref
        .watch(movieServiceProvider)
        .getTrendingMovies(timeWindow: timeWindow));

final getTopRatedMoviesProvider = FutureProvider(
  (ref) => ref.watch(movieServiceProvider).getTopRatedMovies(),
);

final getMoviesProvider = FutureProvider.family<List<Movie>, MovieArguments>(
  (ref, arguments) => ref.watch(movieServiceProvider).getMovies(
        withGenres: arguments.withGenres,
        sortBy: arguments.sortBy,
        includeAdult: arguments.includeAdult,
      ),
);

final getSimilarMoviesProvider = FutureProvider.family<List<Movie>, int>(
    (ref, movieId) =>
        ref.watch(movieServiceProvider).getSimilarMovies(id: movieId));

final getMovieDetailsProvider = FutureProvider.family<MovieDetails, int>(
  (ref, movieId) async {
    final movieService = ref.watch(movieServiceProvider);

    final sessionId = SessionProvider.sessionId;

    MovieAccountState? state;

    if (sessionId != null) {
      state = await movieService.getAccountMovieState(
        id: movieId,
        sessionId: sessionId,
      );
    }

    return movieService
        .getMovieDetails(id: movieId)
        .then((details) => details.copyWith(
              state: state,
            ));
  },
);

final getPersonCreditsProvider = FutureProvider.family<List<Movie>, int>(
    (ref, personId) =>
        ref.watch(movieServiceProvider).getPersonCredits(personId: personId));

final getFavoriteMoviesProvider =
    FutureProvider.family<MovieListModel, AccountMovieArguments>(
  (ref, args) => ref.watch(movieServiceProvider).getFavoriteMovies(
        accountId: args.accountId,
        sessionId: args.sessionId,
        page: args.page,
      ),
);

final getRatedMoviesProvider =
    FutureProvider.family<MovieListModel, AccountMovieArguments>(
  (ref, args) => ref.watch(movieServiceProvider).getRatedMovies(
        accountId: args.accountId,
        sessionId: args.sessionId,
        page: args.page,
      ),
);

final getMovieWatchlistProvider =
    FutureProvider.family<MovieListModel, AccountMovieArguments>(
  (ref, args) => ref.watch(movieServiceProvider).getMovieWatchlist(
        accountId: args.accountId,
        sessionId: args.sessionId,
        page: args.page,
      ),
);
