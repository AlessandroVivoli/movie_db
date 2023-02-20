import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../media/domain/media_arguments.dart';
import '../domain/tv_show.dart';
import 'tv_show_service_provider.dart';

part 'get_tv_shows_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<TVShow>> getTVShows(GetTVShowsRef ref, MediaArguments args) {
  return ref.watch(tvShowServiceProvider).getTVShows(
        withGenres: args.withGenres,
        sortBy: args.sortBy,
        includeAdult: args.includeAdult,
      );
}
