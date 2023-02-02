import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/video_service.dart';
import '../domain/i_video_service.dart';
import '../domain/video.dart';

final videoServiceProvider = Provider<IVideoService>((ref) {
  return VideoService(ref.watch(dioProvider));
});

typedef GetVideosProvider = FutureProviderFamily<List<Video>, int>;

final getVideosProvider = GetVideosProvider((ref, movieId) {
  return ref.watch(videoServiceProvider).getVideos(movieId: movieId);
});
