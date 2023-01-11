import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_details.freezed.dart';
part 'person_details.g.dart';

@freezed
class PersonDetails with _$PersonDetails {
  const factory PersonDetails({
    required String? birthday,
    required String? knownForDepartment,
    required String? deathdday,
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
}
