import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/movie/movie.dart';
import 'movie_service_provider.dart';

typedef GetPersonCreditsProvider = FutureProviderFamily<List<Movie>, int>;

final getPersonCreditsProvider = GetPersonCreditsProvider(
  name: 'GetPersonCreditsProvider',
  (ref, personId) {
    return ref.watch(movieServiceProvider).getPersonCredits(personId: personId);
  },
);
