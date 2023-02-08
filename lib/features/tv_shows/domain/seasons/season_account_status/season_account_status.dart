import 'package:freezed_annotation/freezed_annotation.dart';

import 'numbered_episode_status.dart';

part 'season_account_status.freezed.dart';
part 'season_account_status.g.dart';

@freezed
class SeasonAccountStatus with _$SeasonAccountStatus {
  const factory SeasonAccountStatus({
    required int id,
    required List<NumberedEpisodeStatus> results,
  }) = _SeasonAccountStatus;

  factory SeasonAccountStatus.fromJson(Map<String, Object?> json) =>
      _$SeasonAccountStatusFromJson(json);
}
