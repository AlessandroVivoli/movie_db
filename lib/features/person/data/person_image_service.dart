import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../image/domain/image_model.dart';
import '../domain/i_person_image_service.dart';
import '../domain/profile_sizes_enum.dart';

class PersonImageService extends IPersonImageService {
  final Dio _dio;

  const PersonImageService(Dio dio) : _dio = dio;

  @override
  Future<List<ImageModel>> getPersonImages({required int id}) {
    return _dio
        .get('/person/$id/images')
        .then((res) => List<Map<String, Object?>>.from(res.data['profiles']))
        .then((rawList) => rawList.map(ImageModel.fromJson).toList());
  }

  @override
  String? getPersonProfileUrl({required ProfileSizes size, String? path}) {
    if (path == null) return null;

    return '${dotenv.get('BASE_IMG_URL')}${size.name}$path';
  }
}
