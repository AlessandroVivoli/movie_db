import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/person_service.dart';
import '../domain/i_person_service.dart';

part 'person_service_provider.g.dart';

@riverpod
IPersonService personService(PersonServiceRef ref) {
  return PersonService(ref.watch(dioProvider));
}
