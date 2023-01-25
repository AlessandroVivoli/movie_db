import '../core/models/sort_by/sort_by.dart';

abstract class Sorts {
  static const popularityAsc = SortBy(
    value: 'popularity.asc',
  );
  static const popularityDesc = SortBy(
    value: 'popularity.desc',
  );
  static const releaseDateAsc = SortBy(
    value: 'release_date.asc',
  );
  static const releaseDateDesc = SortBy(
    value: 'release_date.desc',
  );
  static const revenueAsc = SortBy(
    value: 'revenue.asc',
  );
  static const revenueDesc = SortBy(
    value: 'revenue.desc',
  );
  static const primaryReleaseDateAsc = SortBy(
    value: 'primary_release_date.asc',
  );
  static const primaryReleaseDateDesc = SortBy(
    value: 'primary_release_date.desc',
  );
  static const originalTitleAsc = SortBy(
    value: 'original_title.asc',
  );
  static const originalTitleDesc = SortBy(
    value: 'original_title.desc',
  );
  static const voteAverageAsc = SortBy(
    value: 'vote_average.asc',
  );
  static const voteAverageDesc = SortBy(
    value: 'vote_average.desc',
  );
  static const voteCountAsc = SortBy(
    value: 'vote_count.asc',
  );
  static const voteCountDesc = SortBy(
    value: 'vote_count.desc',
  );
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
