// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Video _$$_VideoFromJson(Map<String, dynamic> json) => _$_Video(
      iso_649_1: json['iso_649_1'] as String?,
      iso_3166_1: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      size: json['size'] as int,
      type: json['type'] as String?,
      official: json['official'] as bool,
      publishedAt: json['published_at'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_VideoToJson(_$_Video instance) => <String, dynamic>{
      'iso_649_1': instance.iso_649_1,
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'id': instance.id,
    };
