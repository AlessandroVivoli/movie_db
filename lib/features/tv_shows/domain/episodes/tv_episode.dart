import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/converters/date_time_converter.dart';

part 'tv_episode.freezed.dart';
part 'tv_episode.g.dart';

@freezed
@DateTimeConverter()
class TVEpisode with _$TVEpisode {
  const factory TVEpisode({
    required DateTime? airDate,
    required int episodeNumber,
    required int id,
    required String name,
    required String overview,
    required String productionCode,
    required int seasonNumber,
    required String? stillPath,
    required double voteAverage,
    required int voteCount,
  }) = _TVEpisode;

  factory TVEpisode.fromJson(Map<String, Object?> json) =>
      _$TVEpisodeFromJson(json);
}
