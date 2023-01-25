import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_image_servicer.dart';
import '../models/image/image_model.dart';
import '../services/image_service.dart';

final imageServiceProvider = Provider<IImageService>((ref) => ImageService());

final getPersonImagesProvider = FutureProvider.family<List<ImageModel>, int>(
    (ref, personId) =>
        ref.watch(imageServiceProvider).getPersonImages(id: personId));
