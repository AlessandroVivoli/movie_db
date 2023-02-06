import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dio/provider/dio_provider.dart';
import '../../data/movie_image_service.dart';
import '../../domain/i_movie_image_service.dart';

part 'movie_image_service_provider.g.dart';

@riverpod
IMovieImageService movieImageService(MovieImageServiceRef ref) {
  return MovieImageService(ref.watch(dioProvider));
}
