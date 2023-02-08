import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/converters/date_time_converter.dart';
import 'crew.dart';
import 'guest_star.dart';

part 'tv_episode_details.freezed.dart';
part 'tv_episode_details.g.dart';

@freezed
@DateTimeConverter()
class TVEpisodeDetails with _$TVEpisodeDetails {
  const factory TVEpisodeDetails({
    required DateTime? airDate,
    required List<Crew> crew,
    required int episeodeNumber,
    required List<GuestStar> guestStars,
    required String name,
    required String overview,
    required int id,
    required String? productionCode,
    required int seasonNumber,
    required String? stillPath,
    required double voteAverage,
    required int voteCount,
  }) = _TVEpisodeDetails;

  factory TVEpisodeDetails.fromJson(Map<String, Object?> json) =>
      _$TVEpisodeDetailsFromJson(json);
}
