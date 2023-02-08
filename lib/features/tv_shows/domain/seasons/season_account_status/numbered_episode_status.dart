import 'package:freezed_annotation/freezed_annotation.dart';

part 'numbered_episode_status.freezed.dart';
part 'numbered_episode_status.g.dart';

@freezed
class NumberedEpisodeStatus with _$NumberedEpisodeStatus {
  const factory NumberedEpisodeStatus({
    required int id,
    required int episodeNumber,
    required dynamic rated,
  }) = _NumberedEpisodeStatus;

  factory NumberedEpisodeStatus.fromJson(Map<String, Object?> json) =>
      _$NumberedEpisodeStatusFromJson(json);
}
