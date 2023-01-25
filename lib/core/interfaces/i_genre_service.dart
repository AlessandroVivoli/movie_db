import '../models/genre/genre.dart';

abstract class IGenreService {
  /// Returns the [List] of [Genre] from the api.
  Future<List<Genre>> getGenres();
}
