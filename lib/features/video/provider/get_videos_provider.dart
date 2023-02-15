import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/video.dart';
import 'video_service_provider.dart';

part 'get_videos_provider.g.dart';

@riverpod
Future<List<Video>> getVideos(GetVideosRef ref, int movieId, String mediaType) {
  return ref.read(videoServiceProvider).getVideos(
        mediaId: movieId,
        mediaType: mediaType,
      );
}
