import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../utils/constants.dart';
import '../interfaces/i_person_service.dart';
import '../models/person/details/person_details.dart';
import '../models/person/person.dart';
import '../services/person_service.dart';
import 'dio_provider.dart';

final personServiceProvider = Provider<IPersonService>((ref) {
  return PersonService(ref.read(dioProvider));
});

typedef GetTrendingPersonsProvider
    = FutureProviderFamily<List<Person>, TimeWindow>;

final getTrendingPersonsProvider = GetTrendingPersonsProvider(
  (ref, timeWindow) {
    return ref
        .watch(personServiceProvider)
        .getTrendingPersons(timeWindow: timeWindow)
        .then(
          (value) => value,
          onError: (err) => logError(
            'Could not get trending persons.',
            err.error,
            err.stackTrace,
          ),
        );
  },
);

typedef GetCastProvider = FutureProviderFamily<List<Person>, int>;

final getCastProvider = GetCastProvider((ref, movieId) {
  return ref.watch(personServiceProvider).getCast(movieId: movieId).then(
        (value) => value,
        onError: (err) => logError(
          'Could not get cast.',
          err.error,
          err.stackTrace,
        ),
      );
});

typedef GetPersonDetailsProvider = FutureProviderFamily<PersonDetails, int>;

final getPersonDetailsProvider = GetPersonDetailsProvider((ref, personId) {
  return ref.watch(personServiceProvider).getPersonDetails(id: personId).then(
        (value) => value,
        onError: (err) => logError(
          'Could not get person details',
          err.error,
          err.stackTrace,
        ),
      );
});
