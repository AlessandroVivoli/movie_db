import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/image/image_model.dart';
import 'image_service_provider.dart';

typedef GetPersonImagesProvider = FutureProviderFamily<List<ImageModel>, int>;

final getPersonImagesProvider = GetPersonImagesProvider((ref, personId) {
  return ref.watch(imageServiceProvider).getPersonImages(id: personId);
});
