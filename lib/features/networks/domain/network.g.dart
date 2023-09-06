// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Network _$$_NetworkFromJson(Map<String, dynamic> json) => _$_Network(
      name: json['name'] as String,
      id: json['id'] as int,
      logoPath: json['logo_path'] as String,
      originCountry: json['origin_country'] as String,
    );

Map<String, dynamic> _$$_NetworkToJson(_$_Network instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };
