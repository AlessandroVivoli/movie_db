import '../../image/domain/image_model.dart';
import 'profile_sizes_enum.dart';

abstract class IPersonImageService {
  const IPersonImageService();

  String? getPersonProfileUrl({required ProfileSizes size, String? path});

  Future<List<ImageModel>> getPersonImages({required int id});
}
