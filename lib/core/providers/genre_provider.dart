import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_genre_service.dart';
import '../services/genre_service.dart';

final genreServiceProvider = Provider<IGenreService>((ref) => GenreService());

final getGenresProvider =
    FutureProvider((ref) => ref.watch(genreServiceProvider).getGenres());
