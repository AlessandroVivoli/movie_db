// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDetails _$$_AccountDetailsFromJson(Map<String, dynamic> json) =>
    _$_AccountDetails(
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: json['id'] as int,
      iso_639_1: json['iso_639_1'] as String?,
      iso_3166_1: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      includeAdult: json['include_adult'] as bool,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_AccountDetailsToJson(_$_AccountDetails instance) =>
    <String, dynamic>{
      'avatar': instance.avatar.toJson(),
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
    };
