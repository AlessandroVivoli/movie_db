// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonDetails _$$_PersonDetailsFromJson(Map<String, dynamic> json) =>
    _$_PersonDetails(
      birthday: _$JsonConverterFromJson<String, DateTime?>(
          json['birthday'], const DateTimeConverter().fromJson),
      knownForDepartment: json['known_for_department'] as String?,
      deathday: _$JsonConverterFromJson<String, DateTime?>(
          json['deathday'], const DateTimeConverter().fromJson),
      id: json['id'] as int,
      name: json['name'] as String,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      gender: json['gender'] as int,
      biography: json['biography'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      placeOfBirth: json['place_of_birth'] as String?,
      profilePath: json['profile_path'] as String?,
      adult: json['adult'] as bool,
      imdbId: json['imdb_id'] as String?,
      homepage: json['homepage'] as String?,
    );

Map<String, dynamic> _$$_PersonDetailsToJson(_$_PersonDetails instance) =>
    <String, dynamic>{
      'birthday': const DateTimeConverter().toJson(instance.birthday),
      'known_for_department': instance.knownForDepartment,
      'deathday': const DateTimeConverter().toJson(instance.deathday),
      'id': instance.id,
      'name': instance.name,
      'also_known_as': instance.alsoKnownAs,
      'gender': instance.gender,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'place_of_birth': instance.placeOfBirth,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'imdb_id': instance.imdbId,
      'homepage': instance.homepage,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
