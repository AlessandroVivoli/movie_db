import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_video_service.dart';
import '../models/video/video.dart';
import '../services/video_service.dart';
import 'dio/dio_provider.dart';

final videoServiceProvider = Provider<IVideoService>((ref) {
  return VideoService(ref.watch(dioProvider));
});

typedef GetVideosProvider = FutureProviderFamily<List<Video>, int>;

final getVideosProvider = GetVideosProvider((ref, movieId) {
  return ref.watch(videoServiceProvider).getVideos(movieId: movieId);
});
