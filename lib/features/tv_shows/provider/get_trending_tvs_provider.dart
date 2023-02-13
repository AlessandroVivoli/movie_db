import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../time_window/domain/time_window.dart';
import '../domain/tv_show.dart';
import 'tv_show_service_provider.dart';

part 'get_trending_tvs_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<TVShow>> getTrendingTVShows(
  GetTrendingTVShowsRef ref,
  TimeWindow timeWindow,
) {
  return ref
      .watch(tvShowServiceProvider)
      .getTrendingTVShows(timeWindow: timeWindow);
}
