import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../interfaces/i_image_servicer.dart';
import '../../services/image_service.dart';
import '../dio/dio_provider.dart';

final imageServiceProvider = Provider<IImageService>(
  (ref) => ImageService(ref.watch(dioProvider)),
);
