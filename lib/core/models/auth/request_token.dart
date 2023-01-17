import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token.freezed.dart';
part 'request_token.g.dart';

@freezed
class RequestToken with _$RequestToken {
  const factory RequestToken({
    required bool success,
    required String expiresAt,
    required String requestToken,
  }) = _RequestToken;

  factory RequestToken.fromJson(Map<String, Object?> json) =>
      _$RequestTokenFromJson(json);
}
