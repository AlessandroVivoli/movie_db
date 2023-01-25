import '../../utils/constants.dart';
import '../interfaces/i_person_service.dart';
import '../models/person/details/person_details.dart';
import '../models/person/person.dart';
import '../providers/dio_provider.dart';

class PersonService implements IPersonService {
  @override
  Future<List<Person>> getTrendingPersons({
    TimeWindow timeWindow = TimeWindow.week,
  }) {
    return DioProvider.dio
        .get('/trending/person/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }

  @override
  Future<PersonDetails> getPersonDetails({required int id}) {
    return DioProvider.dio
        .get('/person/$id')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(PersonDetails.fromJson);
  }

  @override
  Future<List<Person>> getCast({required int movieId}) {
    return DioProvider.dio
        .get('/movie/$movieId/credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }
}
