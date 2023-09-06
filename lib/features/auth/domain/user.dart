import 'package:freezed_annotation/freezed_annotation.dart';

import '../../account/domain/account_details.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required AccountDetails accountDetails,
    required String sessionId,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
