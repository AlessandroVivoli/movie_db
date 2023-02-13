import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/tv_image_service.dart';
import '../domain/i_tv_image_service.dart';

part 'tv_image_service_provider.g.dart';

@Riverpod(keepAlive: true)
ITVImageService tvImageService(TvImageServiceRef ref) {
  return TVImageService(ref.watch(dioProvider));
}
