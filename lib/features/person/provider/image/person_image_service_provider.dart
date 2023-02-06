import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../dio/provider/dio_provider.dart';
import '../../data/person_image_service.dart';
import '../../domain/i_person_image_service.dart';

part 'person_image_service_provider.g.dart';

@riverpod
IPersonImageService personImageService(PersonImageServiceRef ref) {
  return PersonImageService(ref.watch(dioProvider));
}
