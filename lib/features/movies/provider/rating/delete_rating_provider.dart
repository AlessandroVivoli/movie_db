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

  void deleteRating(int movieId) async {
    state = const RateState.loading();

    final sessionId = ref.watch(localStorageProvider).getSessionId()!;

    state = await ref
        .read(movieServiceProvider)
        .deleteRating(id: movieId, sessionId: sessionId)
        .then((_) => const RateState.success())
        .catchError(RateState.error);

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getRatedMoviesProvider);
  }
}
