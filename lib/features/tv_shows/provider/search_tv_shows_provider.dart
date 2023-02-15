import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tv_list_model.dart';
import 'tv_show_service_provider.dart';

part 'search_tv_shows_provider.g.dart';

@riverpod
Future<TVListModel> searchTVShows(
  SearchTVShowsRef ref, {
  required String query,
  bool includeAdult = false,
  int page = 1,
}) {
  return ref.watch(tvShowServiceProvider).searchTVShows(
        query: query,
        includeAdult: includeAdult,
        page: page,
      );
}
