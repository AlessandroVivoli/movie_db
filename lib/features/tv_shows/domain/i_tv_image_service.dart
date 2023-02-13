import '../../media/domain/media_images.dart';
import '../../movies/domain/backdrop_sizes_enum.dart';
import '../../movies/domain/poster_sizes_enum.dart';

abstract class ITVImageService {
  const ITVImageService();

  String? getTVBackdropUrl({required BackdropSizes size, String? path});
  String? getTVPosterUrl({required PosterSizes size, String? path});
  Future<MediaImages> getTVImages({required int id});
}
