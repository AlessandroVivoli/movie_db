import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/genre/data/genre_service.dart';
import '../../dio/provider/dio_provider.dart';
import '../domain/i_genre_service.dart';

part 'genre_service_provider.g.dart';

@riverpod
IGenreService genreService(GenreServiceRef ref) {
  return GenreService(ref.watch(dioProvider));
}
