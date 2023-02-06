import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../image/domain/image_model.dart';
import 'person_image_service_provider.dart';

part 'get_person_images_provider.g.dart';

@riverpod
Future<List<ImageModel>> getPersonImages(GetPersonImagesRef ref, int id) {
  return ref.watch(personImageServiceProvider).getPersonImages(id: id);
}
