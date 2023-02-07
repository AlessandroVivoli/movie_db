import '../../movies/domain/movie.dart';
import '../../time_window/domain/time_window.dart';
import 'person.dart';
import 'person_details.dart';

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

  /// Returns the [List] of [Movie] credits using the provided [personId]
  Future<List<Movie>> getPersonCredits({required int personId});
}
