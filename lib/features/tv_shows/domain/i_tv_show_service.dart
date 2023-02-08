import '../../movies/domain/sort_by.dart';
import '../../time_window/domain/time_window.dart';
import 'tv_show.dart';

abstract class ITVShowService {
  Future<List<TVShow>> getTrendingTVShows({
    TimeWindow timeWindow = TimeWindow.week,
  });

  Future<List<TVShow>> getTopRatedTVShows();

  Future<List<TVShow>> getTVShows({
    List<int>? withGenres,
    SortBy sortBy = SortBy.popularityDesc,
    bool includeAdult = false,
  });
}
