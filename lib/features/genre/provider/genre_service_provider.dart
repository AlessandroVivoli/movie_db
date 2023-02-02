import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../../../features/genre/data/genre_service.dart';
import '../domain/i_genre_service.dart';

final genreServiceProvider = Provider<IGenreService>(
  (ref) => GenreService(ref.watch(dioProvider)),
);
