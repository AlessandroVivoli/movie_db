import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/genre.dart';
import 'genre_service_provider.dart';

part 'get_movie_genres_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Genre>> getMovieGenres(GetMovieGenresRef ref) {
  return ref.read(genreServiceProvider).getMovieGenres();
}
