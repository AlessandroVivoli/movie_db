import '../../account/domain/account_media_status/account_media_status.dart';
import '../../media/domain/sort_by.dart';
import '../../time_window/domain/time_window.dart';
import 'tv_show.dart';
import 'tv_show_details.dart';

abstract class ITVShowService {
  const ITVShowService();

  Future<List<TVShow>> getTrendingTVShows({
    TimeWindow timeWindow = TimeWindow.week,
  });

  Future<List<TVShow>> getTopRatedTVShows();

  Future<List<TVShow>> getTVShows({
    List<int>? withGenres,
    SortBy sortBy = SortBy.popularityDesc,
    bool includeAdult = false,
  });

  Future<AccountMediaStatus> getTVAccountStatus({required int id});

  Future<void> rateTV({
    required int id,
    required double rating,
  });

  Future<void> deleteTVRating({required int id});

  Future<TVShowDetails> getTVShowDetails({required int id});
}
