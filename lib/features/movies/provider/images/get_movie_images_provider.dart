import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../media/domain/media_images.dart';
import 'movie_image_service_provider.dart';

part 'get_movie_images_provider.g.dart';

@riverpod
Future<MediaImages> movieImages(MovieImagesRef ref, int movieId) {
  return ref.watch(movieImageServiceProvider).getMediaImages(id: movieId);
}
