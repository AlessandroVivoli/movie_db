import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../interfaces/i_movie_service.dart';
import '../../models/movie/account_state/movie_account_state.dart';
import '../../models/movie/details/movie_details.dart';
import '../local_storage/local_storage_provider.dart';
import 'movie_service_provider.dart';

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
