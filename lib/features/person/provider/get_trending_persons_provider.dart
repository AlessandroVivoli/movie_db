import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/person.dart';
import 'person_service_provider.dart';

part 'get_trending_persons_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Person>> getTrendingPersons(
  GetTrendingPersonsRef ref,
  String timeWindow,
) {
  return ref
      .watch(personServiceProvider)
      .getTrendingPersons(timeWindow: timeWindow);
}
