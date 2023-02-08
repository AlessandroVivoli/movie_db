import 'package:dio/dio.dart';

import '../domain/genre.dart';
import '../domain/i_genre_service.dart';

class GenreService implements IGenreService {
  final Dio _dio;

  const GenreService(Dio dio) : _dio = dio;

  @override
  Future<List<Genre>> getMovieGenres() {
    return _dio
        .get('/genre/movie/list')
        .then((res) => List<Map<String, Object?>>.from(res.data['genres']))
        .then((rawList) => rawList.map(Genre.fromJson).toList());
  }

  @override
  Future<List<Genre>> getTVGenres() {
    return _dio
        .get('/genre/tv/list')
        .then((res) => List<Map<String, Object?>>.from(res.data['genres']))
        .then((rawList) => rawList.map(Genre.fromJson).toList());
  }
}
