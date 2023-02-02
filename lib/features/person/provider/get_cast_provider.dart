import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/person.dart';
import 'person_service_provider.dart';

part 'get_cast_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Person>> getCast(GetCastRef ref, int movieId) {
  return ref.watch(personServiceProvider).getCast(movieId: movieId);
}
