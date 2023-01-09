import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageService {
  static String getImageUrl({required String size, required String path}) {
    return '${dotenv.env['BASE_IMG_URL']}$size$path';
  }
}
