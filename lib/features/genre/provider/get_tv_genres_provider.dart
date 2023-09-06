import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/genre.dart';
import 'genre_service_provider.dart';

part 'get_tv_genres_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Genre>> getTVGenres(GetTVGenresRef ref) {
  return ref.watch(genreServiceProvider).getTVGenres();
}
