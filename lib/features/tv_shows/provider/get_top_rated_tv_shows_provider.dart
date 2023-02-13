import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tv_show.dart';
import 'tv_show_service_provider.dart';

part 'get_top_rated_tv_shows_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<TVShow>> getTopRatedTVShows(GetTopRatedTVShowsRef ref) {
  return ref.read(tvShowServiceProvider).getTopRatedTVShows();
}
