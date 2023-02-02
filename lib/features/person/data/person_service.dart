import 'package:dio/dio.dart';

import '../../time_window/domain/time_window.dart';
import '../domain/i_person_service.dart';
import '../domain/person.dart';
import '../domain/person_details.dart';

class PersonService implements IPersonService {
  final Dio _dio;

  const PersonService(Dio dio) : _dio = dio;

  @override
  Future<List<Person>> getTrendingPersons({
    TimeWindow timeWindow = TimeWindow.week,
  }) {
    return _dio
        .get('/trending/person/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }

  @override
  Future<PersonDetails> getPersonDetails({required int id}) {
    return _dio
        .get('/person/$id')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(PersonDetails.fromJson);
  }

  @override
  Future<List<Person>> getCast({required int movieId}) {
    return _dio
        .get('/movie/$movieId/credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }
}
