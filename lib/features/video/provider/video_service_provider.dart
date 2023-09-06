import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/video_service.dart';
import '../domain/i_video_service.dart';

part 'video_service_provider.g.dart';

@Riverpod(keepAlive: true)
IVideoService videoService(VideoServiceRef ref) {
  return VideoService(ref.watch(dioProvider));
}
