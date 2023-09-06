// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Crew _$$_CrewFromJson(Map<String, dynamic> json) => _$_Crew(
      id: json['id'] as int,
      creditId: json['credit_id'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$_CrewToJson(_$_Crew instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'department': instance.department,
      'job': instance.job,
      'profile_path': instance.profilePath,
    };
