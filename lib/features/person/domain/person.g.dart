// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$$_PersonFromJson(Map<String, dynamic> json) => _$_Person(
      profilePath: json['profile_path'] as String?,
      adult: json['adult'] as bool?,
      id: json['id'] as int,
      knownFor: json['known_for'] as List<dynamic>?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'id': instance.id,
      'known_for': instance.knownFor,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'popularity': instance.popularity,
    };
