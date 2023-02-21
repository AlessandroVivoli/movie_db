import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../../media/domain/i_media_image_service.dart';
import '../data/tv_image_service.dart';

part 'tv_image_service_provider.g.dart';

@Riverpod(keepAlive: true)
IMediaImageService tvImageService(TvImageServiceRef ref) {
  return TVImageService(ref.watch(dioProvider));
}
