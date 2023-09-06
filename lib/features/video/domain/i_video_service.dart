import 'video.dart';

abstract class IVideoService {
  /// Returns the [List] of movie [Video] using the provided [mediaId].
  Future<List<Video>> getVideos({
    required int mediaId,
    required String mediaType,
  });
}
