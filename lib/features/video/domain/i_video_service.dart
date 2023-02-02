import 'video.dart';

abstract class IVideoService {
  /// Returns the [List] of movie [Video] using the provided [movieId].
  Future<List<Video>> getVideos({required int movieId});
}
