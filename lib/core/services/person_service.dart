import '../../utils/constants.dart';
import '../models/person/details/person_details.dart';
import '../models/person/person.dart';
import '../providers/dio_provider.dart';

class PersonService {
  /// Returns trending [List] of [Person] future.
  ///
  /// [timeWindow] can only be `week` or `day`.\
  /// Defaults to `week`.
  static Future<List<Person>> getTrendingPersons({
    TimeWindow timeWindow = TimeWindow.week,
  }) {
    return DioProvider.dio
        .get('/trending/person/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }

  /// Returns [PersonDetials] future using the provided person [id]
  static Future<PersonDetails> getPersonDetails({required int id}) {
    return DioProvider.dio
        .get('/person/$id')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(PersonDetails.fromJson);
  }

  /// Returns the [List] of [Person] cast using the provided [movieId]
  static Future<List<Person>> getCast({required int movieId}) {
    return DioProvider.dio
        .get('/movie/$movieId/credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }
}
