import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/image/data/image_service.dart';
import '../../dio/provider/dio_provider.dart';
import '../domain/i_image_service.dart';

part 'image_service_provider.g.dart';

@riverpod
IImageService imageService(ImageServiceRef ref) {
  return ImageService(ref.watch(dioProvider));
}
