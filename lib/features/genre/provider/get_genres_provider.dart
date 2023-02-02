import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/genre.dart';
import 'genre_service_provider.dart';

part 'get_genres_provider.g.dart';

@riverpod
Future<List<Genre>> getGenres(GetGenresRef ref) {
  return ref.watch(genreServiceProvider).getGenres();
}
