import 'package:dio/dio.dart';

import '../domain/i_video_service.dart';
import '../domain/video.dart';

class VideoService implements IVideoService {
  final Dio _dio;

  const VideoService(Dio dio) : _dio = dio;

  @override
  Future<List<Video>> getVideos({
    required int mediaId,
    required String mediaType,
  }) {
    return _dio
        .get('/$mediaType/$mediaId/videos')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Video.fromJson))
        .then((videos) => videos.toList());
  }
}
