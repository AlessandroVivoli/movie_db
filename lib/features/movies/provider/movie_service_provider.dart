import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/movie_service.dart';
import '../domain/i_movie_service.dart';

part 'movie_service_provider.g.dart';

@riverpod
IMovieService movieService(MovieServiceRef ref) {
  return MovieService(ref.watch(dioProvider));
}
