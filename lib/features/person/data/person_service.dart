import 'package:dio/dio.dart';

import '../../movies/domain/movie.dart';
import '../../time_window/domain/time_window.dart';
import '../domain/i_person_service.dart';
import '../domain/person.dart';
import '../domain/person_details.dart';

class PersonService implements IPersonService {
  final Dio _dio;

  const PersonService(Dio dio) : _dio = dio;

  @override
  Future<List<Person>> getTrendingPersons({
    String timeWindow = TimeWindow.week,
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
  Future<List<Person>> getCast({
    required int mediaId,
    required String mediaType,
  }) {
    return _dio
        .get('/$mediaType/$mediaId/credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Person.fromJson))
        .then((persons) => persons.toList());
  }

  @override
  Future<List<Movie>> getPersonCredits({required int personId}) {
    return _dio
        .get('/person/$personId/movie_credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }
}
