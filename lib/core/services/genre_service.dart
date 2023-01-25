import '../interfaces/i_genre_service.dart';
import '../models/genre/genre.dart';
import '../providers/dio_provider.dart';

class GenreService implements IGenreService {
  @override
  Future<List<Genre>> getGenres() {
    return DioProvider.dio
        .get('/genre/movie/list')
        .then((res) => List<Map<String, Object?>>.from(res.data['genres']))
        .then((rawList) => rawList.map(Genre.fromJson))
        .then((genres) => genres.toList());
  }
}
