import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/person_details.dart';
import 'person_service_provider.dart';

part 'get_person_details_provider.g.dart';

@Riverpod(keepAlive: true)
Future<PersonDetails> getPersonDetails(GetPersonDetailsRef ref, int personId) {
  return ref.watch(personServiceProvider).getPersonDetails(id: personId);
}
