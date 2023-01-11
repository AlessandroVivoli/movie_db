import '../models/person/details/person_details.dart';
import '../models/person/person.dart';
import '../providers/dio_provider.dart';

class PersonService {
  static Future<List<Person>> getTrendingPersons({
    String timeWindow = 'week',
  }) {
    return DioProvider.dio
        .get('/trending/person/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }

  static Future<PersonDetails> getPersonDetails({required String id}) {
    return DioProvider.dio
        .get('/person/$id')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(PersonDetails.fromJson);
  }

  static Future<List<Person>> getCast({required int movieId}) {
    return DioProvider.dio
        .get('/movie/$movieId/credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }
}
