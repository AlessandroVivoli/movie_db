import '../../movies/domain/backdrop_sizes_enum.dart';
import '../../movies/domain/poster_sizes_enum.dart';
import 'media_images.dart';

abstract class IMediaImageService {
  const IMediaImageService();

  String? getMediaBackdropUrl({required BackdropSizes size, String? path});

  String? getMediaPosterUrl({required PosterSizes size, String? path});

  Future<MediaImages> getMediaImages({required int id});
}
