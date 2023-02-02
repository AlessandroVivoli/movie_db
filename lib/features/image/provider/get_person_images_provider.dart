import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/image_model.dart';
import 'image_service_provider.dart';

part 'get_person_images_provider.g.dart';

@riverpod
Future<List<ImageModel>> getPersonImages(GetPersonImagesRef ref, int personId) {
  return ref.watch(imageServiceProvider).getPersonImages(id: personId);
}
