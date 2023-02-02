import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../local_storage/provider/local_storage_provider.dart';
import '../domain/account_state/movie_account_state.dart';
import '../domain/i_movie_service.dart';
import '../domain/movie_details.dart';
import 'movie_service_provider.dart';

part 'get_movie_details_provider.g.dart';

@Riverpod(keepAlive: true)
Future<MovieDetails> getMovieDetails(GetMovieDetailsRef ref, int movieId) {
  final movieService = ref.read(movieServiceProvider);

  return _getMovieState(ref, movieService, movieId).then(
    (movieState) => movieService
        .getMovieDetails(id: movieId)
        .then((movieDetails) => movieDetails.copyWith(state: movieState)),
  );
}

Future<MovieAccountState?> _getMovieState(
  FutureProviderRef ref,
  IMovieService movieService,
  int movieId,
) async {
  final sessionId = ref.watch(localStorageProvider).getSessionId();

  if (sessionId == null) return null;

  return movieService.getAccountMovieState(id: movieId, sessionId: sessionId);
}
