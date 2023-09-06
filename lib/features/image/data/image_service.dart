import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/i_image_service.dart';

class ImageService extends IImageService {
  @override
  String? getImageUrl({required String? path}) {
    if (path == null) return null;

    if (path.contains('https') || path.contains('http')) {
      return path.replaceFirstMapped(RegExp(r'^\/'), (match) => '');
    }

    return '${dotenv.get('BASE_IMG_URL')}original$path';
  }
}
