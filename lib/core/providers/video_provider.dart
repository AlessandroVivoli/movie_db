import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/i_video_service.dart';
import '../models/video/video.dart';
import '../services/video_service.dart';

final videoServiceProvider = Provider<IVideoService>((ref) => VideoService());

final getVideosProvider = FutureProvider.family<List<Video>, int>(
  (ref, movieId) => ref.watch(videoServiceProvider).getVideos(movieId: movieId),
);
