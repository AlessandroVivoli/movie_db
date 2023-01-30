import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_image_servicer.dart';
import '../models/image/image_model.dart';
import '../services/image_service.dart';
import 'dio_provider.dart';

final imageServiceProvider = Provider<IImageService>(
  (ref) => ImageService(ref.watch(dioProvider)),
);

typedef GetPersonImagesProvider = FutureProviderFamily<List<ImageModel>, int>;

final getPersonImagesProvider = GetPersonImagesProvider((ref, personId) {
  return ref.watch(imageServiceProvider).getPersonImages(id: personId);
});
