import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../../time_window/domain/time_window.dart';
import '../data/person_service.dart';
import '../domain/i_person_service.dart';
import '../domain/person.dart';
import '../domain/person_details.dart';

final personServiceProvider = Provider<IPersonService>((ref) {
  return PersonService(ref.watch(dioProvider));
});

typedef GetTrendingPersonsProvider
    = FutureProviderFamily<List<Person>, TimeWindow>;

final getTrendingPersonsProvider = GetTrendingPersonsProvider(
  (ref, timeWindow) => ref
      .watch(personServiceProvider)
      .getTrendingPersons(timeWindow: timeWindow),
);

typedef GetCastProvider = FutureProviderFamily<List<Person>, int>;

final getCastProvider = GetCastProvider((ref, movieId) {
  return ref.watch(personServiceProvider).getCast(movieId: movieId);
});

typedef GetPersonDetailsProvider = FutureProviderFamily<PersonDetails, int>;

final getPersonDetailsProvider = GetPersonDetailsProvider((ref, personId) {
  return ref.watch(personServiceProvider).getPersonDetails(id: personId);
});
