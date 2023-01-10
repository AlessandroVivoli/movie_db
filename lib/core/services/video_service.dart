import '../models/video/video.dart';
import '../providers/dio_provider.dart';

class VideoService {
  static Future<List<Video>> getVideos({required int movieId}) {
    return DioProvider.dio
        .get('/movie/$movieId/videos')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Video.fromJson))
        .then((videos) => videos.toList());
  }
}
