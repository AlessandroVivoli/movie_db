import '../../movies/domain/backdrop_sizes_enum.dart';
import '../../movies/domain/poster_sizes_enum.dart';
import 'tv_images.dart';

abstract class ITVImageService {
  const ITVImageService();

  String? getTVBackdropUrl({required BackdropSizes size, String? path});
  String? getTVPosterUrl({required PosterSizes size, String? path});
  Future<TVImages> getTVImages({required int id});
}
