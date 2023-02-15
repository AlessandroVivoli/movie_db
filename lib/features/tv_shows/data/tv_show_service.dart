import 'package:dio/dio.dart';

import '../../account/domain/account_media_status/account_media_status.dart';
import '../../media/domain/sort_by.dart';
import '../../time_window/domain/time_window.dart';
import '../domain/i_tv_show_service.dart';
import '../domain/tv_list_model.dart';
import '../domain/tv_show.dart';
import '../domain/tv_show_details.dart';

class TVShowService extends ITVShowService {
  final Dio _dio;

  const TVShowService(Dio dio) : _dio = dio;

  @override
  Future<void> deleteTVRating({required int id}) {
    return _dio.delete(
      '/tv/$id/rating',
    );
  }

  @override
  Future<AccountMediaStatus> getTVAccountStatus({
    required int id,
  }) {
    return _dio
        .get(
          '/tv/$id/account_states',
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(AccountMediaStatus.fromJson);
  }

  @override
  Future<List<TVShow>> getTVShows({
    List<int>? withGenres,
    SortBy sortBy = SortBy.popularityDesc,
    bool includeAdult = false,
  }) {
    return _dio
        .get(
          '/discover/tv',
          queryParameters: {
            'with_genres': withGenres?.join(','),
            'sort_by': sortBy.toString(),
            'include_adult': includeAdult,
          },
        )
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((list) => list.map(TVShow.fromJson).toList());
  }

  @override
  Future<List<TVShow>> getTopRatedTVShows() {
    return _dio
        .get('/tv/top_rated')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((list) => list.map(TVShow.fromJson).toList());
  }

  @override
  Future<List<TVShow>> getTrendingTVShows({
    TimeWindow timeWindow = TimeWindow.week,
  }) {
    return _dio
        .get('/trending/tv/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((list) => list.map(TVShow.fromJson).toList());
  }

  @override
  Future<void> rateTV({
    required int id,
    required double rating,
  }) {
    return _dio.post(
      '/tv/$id/rating',
      data: {
        'value': rating,
      },
    );
  }

  @override
  Future<TVShowDetails> getTVShowDetails({required int id}) {
    return _dio
        .get(
          '/tv/$id',
          queryParameters: {
            'append_to_response': 'reviews,account_states',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(TVShowDetails.fromJson);
  }

  @override
  Future<TVListModel> searchTVShows({
    required String query,
    bool includeAdult = false,
    int page = 1,
  }) {
    return _dio
        .get(
          '/search/tv',
          queryParameters: {
            'query': query,
            'include_adult': includeAdult,
            'page': page
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(TVListModel.fromJson);
  }

  @override
  Future<List<TVShow>> getSimilarTVShows({required int tvId}) {
    return _dio
        .get('/tv/$tvId/similar')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(TVShow.fromJson).toList());
  }
}
