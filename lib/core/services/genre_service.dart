import 'package:dio/dio.dart';

import '../interfaces/i_genre_service.dart';
import '../models/genre/genre.dart';

class GenreService implements IGenreService {
  final Dio _dio;

  const GenreService(Dio dio) : _dio = dio;

  @override
  Future<List<Genre>> getGenres() {
    return _dio
        .get('/genre/movie/list')
        .then((res) => List<Map<String, Object?>>.from(res.data['genres']))
        .then((rawList) => rawList.map(Genre.fromJson))
        .then((genres) => genres.toList());
  }
}
