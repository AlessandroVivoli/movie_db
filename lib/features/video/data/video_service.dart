import 'package:dio/dio.dart';

import '../domain/i_video_service.dart';
import '../domain/video.dart';

class VideoService implements IVideoService {
  final Dio _dio;

  const VideoService(Dio dio) : _dio = dio;

  @override
  Future<List<Video>> getVideos({required int movieId}) {
    return _dio
        .get('/movie/$movieId/videos')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Video.fromJson))
        .then((videos) => videos.toList());
  }
}
