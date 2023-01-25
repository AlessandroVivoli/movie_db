import '../../utils/constants.dart';
import '../models/person/details/person_details.dart';
import '../models/person/person.dart';

abstract class IPersonService {
  /// Returns trending [List] of [Person] future.
  ///
  /// [timeWindow] can only be `week` or `day`.\
  /// Defaults to `week`.
  Future<List<Person>> getTrendingPersons({
    TimeWindow timeWindow = TimeWindow.week,
  });

  /// Returns [PersonDetials] future using the provided person [id].
  Future<PersonDetails> getPersonDetails({required int id});

  /// Returns the [List] of [Person] cast using the provided [movieId].
  Future<List<Person>> getCast({required int movieId});
}
