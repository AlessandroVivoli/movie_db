import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'genre_service_provider.dart';

final getGenresProvider = FutureProvider(
  (ref) => ref.watch(genreServiceProvider).getGenres(),
);
