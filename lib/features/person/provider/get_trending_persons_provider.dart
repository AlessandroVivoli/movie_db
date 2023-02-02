import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../time_window/domain/time_window.dart';
import '../domain/person.dart';
import 'person_service_provider.dart';

part 'get_trending_persons_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Person>> getTrendingPersons(
  GetTrendingPersonsRef ref,
  TimeWindow timeWindow,
) {
  return ref
      .watch(personServiceProvider)
      .getTrendingPersons(timeWindow: timeWindow);
}
