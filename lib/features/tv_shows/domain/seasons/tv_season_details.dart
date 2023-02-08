import 'package:built_value/built_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/converters/date_time_converter.dart';
import '../episodes/tv_episode.dart';

part 'tv_season_details.freezed.dart';
part 'tv_season_details.g.dart';

@freezed
@DateTimeConverter()
class TVSeasonDetails with _$TVSeasonDetails {
  const factory TVSeasonDetails({
    @JsonKey(name: '_id') required String seasonId,
    required DateTime? airDate,
    required List<TVEpisode> episodes,
    required String name,
    required String overview,
    required int id,
    required String? posterPath,
    required int seasonNumber,
  }) = _TVSeasonDetails;

  factory TVSeasonDetails.fromJson(Map<String, Object?> json) =>
      _$TVSeasonDetailsFromJson(json);
}
