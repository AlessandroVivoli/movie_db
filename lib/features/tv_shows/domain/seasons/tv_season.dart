import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/converters/date_time_converter.dart';

part 'tv_season.freezed.dart';
part 'tv_season.g.dart';

@freezed
class TVSeason with _$TVSeason {
  const factory TVSeason({
    @DateTimeConverter() required DateTime? airDate,
    required int episodeCount,
    required int id,
    required String name,
    required String overview,
    required String? posterPath,
    required int seasonNumber,
  }) = _TVSeason;

  factory TVSeason.fromJson(Map<String, Object?> json) =>
      _$TVSeasonFromJson(json);
}
