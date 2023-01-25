import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants.dart';
import '../interfaces/i_person_service.dart';
import '../models/person/details/person_details.dart';
import '../models/person/person.dart';
import '../services/person_service.dart';

final personServiceProvider = Provider<IPersonService>(
  (ref) => PersonService(),
);

final getTrendingPersonsProvider =
    FutureProvider.family<List<Person>, TimeWindow>((ref, timeWindow) => ref
        .watch(personServiceProvider)
        .getTrendingPersons(timeWindow: timeWindow));

final getCastProvider = FutureProvider.family<List<Person>, int>(
    (ref, movieId) =>
        ref.watch(personServiceProvider).getCast(movieId: movieId));

final getPersonDetailsProvider = FutureProvider.family<PersonDetails, int>(
  (ref, personId) =>
      ref.watch(personServiceProvider).getPersonDetails(id: personId),
);
