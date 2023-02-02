import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/movie.dart';
import 'movie_service_provider.dart';

part 'get_person_credits_provider.g.dart';

@riverpod
Future<List<Movie>> getPersonCredits(GetPersonCreditsRef ref, int personId) {
  return ref.watch(movieServiceProvider).getPersonCredits(personId: personId);
}
