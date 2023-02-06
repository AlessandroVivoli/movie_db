import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/i_image_service.dart';

class ImageService extends IImageService {
  @override
  String? getImageUrl({required String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}original$path';
  }
}
