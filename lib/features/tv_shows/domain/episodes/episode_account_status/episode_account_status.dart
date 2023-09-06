import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_account_status.freezed.dart';
part 'episode_account_status.g.dart';

@freezed
class EpisodeAccountStatus with _$EpisodeAccountStatus {
  const factory EpisodeAccountStatus({
    required int id,
    required dynamic rated,
  }) = _EpisodeAccountStatus;

  factory EpisodeAccountStatus.fromJson(Map<String, Object?> json) =>
      _$EpisodeAccountStatusFromJson(json);
}
