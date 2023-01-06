import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageService {
  static NetworkImage getImage({required String size, required String path}) {
    return NetworkImage('${dotenv.env['BASE_IMG_URL']}$size$path');
  }
}
