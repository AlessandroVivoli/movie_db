import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../movies/domain/movie.dart';
import 'person_service_provider.dart';

part 'get_person_credits_provider.g.dart';

@riverpod
Future<List<Movie>> getPersonCredits(GetPersonCreditsRef ref, int personId) {
  return ref.read(personServiceProvider).getPersonCredits(personId: personId);
}
