import 'package:freezed_annotation/freezed_annotation.dart';

import 'avatar/avatar.dart';

part 'account_details.freezed.dart';
part 'account_details.g.dart';

@freezed
class AccountDetails with _$AccountDetails {
  const factory AccountDetails({
    required Avatar avatar,
    required int id,
    required String? iso_639_1,
    required String? iso_3166_1,
    required String? name,
    required bool includeAdult,
    required String username,
  }) = _AccountDetails;

  factory AccountDetails.fromJson(Map<String, Object?> json) =>
      _$AccountDetailsFromJson(json);
}
