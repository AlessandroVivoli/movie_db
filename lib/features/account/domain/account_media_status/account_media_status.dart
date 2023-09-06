import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_media_status.freezed.dart';
part 'account_media_status.g.dart';

@freezed
class AccountMediaStatus with _$AccountMediaStatus {
  const factory AccountMediaStatus({
    required int? id,
    required bool favorite,
    required dynamic rated,
    required bool watchlist,
  }) = _AccountMediaStatus;

  factory AccountMediaStatus.fromJson(Map<String, Object?> json) =>
      _$AccountMediaStatusFromJson(json);
}
