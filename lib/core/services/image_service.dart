import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageService {
  static String? getImageUrl({required String size, required String? path}) {
    if (path == null) return null;

    return '${dotenv.env['BASE_IMG_URL']}$size$path';
  }
}
