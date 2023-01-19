class SortBy {
  final String _value;

  static const popularityAsc = SortBy._('popularity.asc');
  static const popularityDesc = SortBy._('popularity.desc');
  static const releaseDateAsc = SortBy._('release_date.asc');
  static const releaseDateDesc = SortBy._('release_date.desc');
  static const revenueAsc = SortBy._('revenue.asc');
  static const revenueDesc = SortBy._('revenue.desc');
  static const primaryReleaseDateAsc = SortBy._('primary_release_date.asc');
  static const primaryReleaseDateDesc = SortBy._('primary_release_date.desc');
  static const originalTitleAsc = SortBy._('original_title.asc');
  static const originalTitleDesc = SortBy._('original_title.desc');
  static const voteAverageAsc = SortBy._('vote_average.asc');
  static const voteAverageDesc = SortBy._('vote_average.desc');
  static const voteCountAsc = SortBy._('vote_count.asc');
  static const voteCountDesc = SortBy._('vote_count.desc');

  const SortBy._(String value) : _value = value;

  @override
  String toString() {
    // TODO: implement toString
    return _value;
  }
}

class TimeWindow {
  final String _value;

  static const week = TimeWindow._('week');
  static const day = TimeWindow._('day');

  const TimeWindow._(String value) : _value = value;

  @override
  String toString() {
    return _value;
  }
}
