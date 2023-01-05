import 'package:dio/dio.dart';

import '../models/person/person.dart';
import '../providers/dio_provider.dart';

class PersonService {
  static Future<List<Person>> getTrendingPersons({
    String timeWindow = 'week',
  }) async {
    try {
      Response<dynamic> response =
          await DioProvider.dio.get('/trending/person/$timeWindow');

      final rawData = List<Map<String, dynamic>>.from(
        Map<String, dynamic>.from(response.data)['results'],
      );

      final data = rawData.map(Person.fromJson).toList();

      return data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
