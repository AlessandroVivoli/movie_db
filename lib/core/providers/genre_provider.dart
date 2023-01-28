import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_genre_service.dart';
import '../services/genre_service.dart';
import 'dio_provider.dart';

final genreServiceProvider = Provider<IGenreService>(
  (ref) => GenreService(ref.read(dioProvider)),
);

final getGenresProvider =
    FutureProvider((ref) => ref.watch(genreServiceProvider).getGenres());
