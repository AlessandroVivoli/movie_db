import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../account/provider/get_rated_movies_provider.dart';
import '../../../local_storage/provider/local_storage_provider.dart';
import '../../domain/rate_state.dart';
import '../get_movie_details_provider.dart';
import '../movie_service_provider.dart';

part 'delete_rating_provider.g.dart';

@riverpod
class DeleteRating extends _$DeleteRating {
  @override
  RateState build() => const RateState.idle();

  void deleteRating(int movieId) {
    state = const RateState.loading();

    final sessionId = ref.watch(localStorageProvider).getSessionId()!;

    ref
        .read(movieServiceProvider)
        .deleteRating(id: movieId, sessionId: sessionId)
        .catchError((err) => state = RateState.error(err, err.stackTrace))
        .then((_) => _refreshRatings(ref, movieId));
  }

  void _refreshRatings(Ref ref, int movieId) {
    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getRatedMoviesProvider);

    state = const RateState.success();
  }
}
