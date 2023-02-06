import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/movie_images.dart';
import 'movie_image_service_provider.dart';

part 'get_movie_images_provider.g.dart';

@riverpod
Future<MovieImages> movieImages(MovieImagesRef ref, int movieId) {
  return ref.watch(movieImageServiceProvider).getMovieImages(id: movieId);
}
