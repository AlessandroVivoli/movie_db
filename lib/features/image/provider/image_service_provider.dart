import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/image_service.dart';
import '../domain/i_image_service.dart';

part 'image_service_provider.g.dart';

@riverpod
IImageService imageService(ImageServiceRef ref) => ImageService();
