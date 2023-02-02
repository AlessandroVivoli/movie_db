import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../../../features/image/data/image_service.dart';
import '../domain/i_image_service.dart';

final imageServiceProvider = Provider<IImageService>(
  (ref) => ImageService(ref.watch(dioProvider)),
);
