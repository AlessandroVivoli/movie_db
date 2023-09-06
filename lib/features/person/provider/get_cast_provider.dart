import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/person.dart';
import 'person_service_provider.dart';

part 'get_cast_provider.g.dart';

@riverpod
Future<List<Person>> getCast(GetCastRef ref, int mediaId, String mediaType) {
  return ref.watch(personServiceProvider).getCast(
        mediaId: mediaId,
        mediaType: mediaType,
      );
}
