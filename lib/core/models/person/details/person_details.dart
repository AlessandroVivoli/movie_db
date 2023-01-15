import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'person_details.freezed.dart';
part 'person_details.g.dart';

@freezed
class PersonDetails with _$PersonDetails {
  const PersonDetails._();

  const factory PersonDetails({
    required String? birthday,
    required String? knownForDepartment,
    required String? deathday,
    required int id,
    required String name,
    required List<String>? alsoKnownAs,
    required int gender,
    required String? biography,
    required double popularity,
    required String? placeOfBirth,
    required String? profilePath,
    required bool adult,
    required String? imdbId,
    required String? homepage,
  }) = _PersonDetails;

  factory PersonDetails.fromJson(Map<String, Object?> json) =>
      _$PersonDetailsFromJson(json);

  String get age {
    final birthdayDate = DateTime.tryParse(birthday ?? '');

    if (birthdayDate == null) return 'No age recorded';

    final age = DateTime.now().difference(birthdayDate);
    return '${(age.inDays / 365).floor()}';
  }

  String getLifetime(bool extendedDate) {
    final birthdayDate = DateTime.tryParse(birthday ?? '');
    final deathdayDate = DateTime.tryParse(deathday ?? '');

    final String pattern = (extendedDate) ? 'yMMMMd' : 'yMMMd';

    final birthdayFormat =
        (birthdayDate == null) ? '?' : DateFormat(pattern).format(birthdayDate);
    final deathdayFormat =
        (deathdayDate == null) ? '?' : DateFormat(pattern).format(deathdayDate);

    final lifetimeFormat = (birthdayDate == null && deathdayDate == null)
        ? '?'
        : '$birthdayFormat - $deathdayFormat';

    return lifetimeFormat;
  }
}
