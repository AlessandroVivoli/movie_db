import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_id.freezed.dart';
part 'session_id.g.dart';

@freezed
class SessionId with _$SessionId {
  const factory SessionId({
    required bool success,
    required String sessionId,
  }) = _SessionId;

  factory SessionId.fromJson(Map<String, Object?> json) =>
      _$SessionIdFromJson(json);
}
