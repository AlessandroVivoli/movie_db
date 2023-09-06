import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dio/provider/dio_provider.dart';
import '../../../media/domain/i_media_image_service.dart';
import '../../data/movie_image_service.dart';

part 'movie_image_service_provider.g.dart';

@Riverpod(keepAlive: true)
IMediaImageService movieImageService(MovieImageServiceRef ref) {
  return MovieImageService(ref.watch(dioProvider));
}
