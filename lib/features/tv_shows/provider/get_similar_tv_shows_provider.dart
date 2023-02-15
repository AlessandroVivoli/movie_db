import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tv_show.dart';
import 'tv_show_service_provider.dart';

part 'get_similar_tv_shows_provider.g.dart';

@riverpod
Future<List<TVShow>> getSimilarTVShows(GetSimilarTVShowsRef ref, int tvId) {
  return ref.watch(tvShowServiceProvider).getSimilarTVShows(tvId: tvId);
}
