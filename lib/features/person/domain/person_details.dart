import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../core/converters/date_time_converter.dart';

part 'person_details.freezed.dart';
part 'person_details.g.dart';

@freezed
class PersonDetails with _$PersonDetails {
  const PersonDetails._();

  const factory PersonDetails({
    @DateTimeConverter() required DateTime? birthday,
    required String? knownForDepartment,
    @DateTimeConverter() required DateTime? deathday,
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
    if (birthday == null) return 'No age recorded';

    final age = DateTime.now().difference(birthday!);
    return '${(age.inDays / 365).floor()}';
  }

  String getLifetime(bool extendedDate, Locale locale) {
    final String pattern = (extendedDate)
        ? _localePattern[locale.languageCode]![1]
        : _localePattern[locale.languageCode]![0];

    final birthdayFormat = (birthday == null)
        ? '?'
        : DateFormat(pattern, locale.languageCode).format(birthday!);
    final deathdayFormat = (deathday == null)
        ? '?'
        : DateFormat(pattern, locale.languageCode).format(deathday!);

    final lifetimeFormat = (birthday == null && deathday == null)
        ? '?'
        : '$birthdayFormat - $deathdayFormat';

    return lifetimeFormat;
  }
}

Map<String, List<String>> _localePattern = {
  'hr': ['d. MMM y.', 'd. MMMMM y.'],
  'en': ['yMMMd', 'yMMMMd'],
};
