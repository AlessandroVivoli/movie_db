// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_star.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuestStar _$$_GuestStarFromJson(Map<String, dynamic> json) => _$_GuestStar(
      id: json['id'] as int,
      name: json['name'] as String,
      creditId: json['credit_id'] as String,
      character: json['character'] as String,
      order: json['order'] as int,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$_GuestStarToJson(_$_GuestStar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'credit_id': instance.creditId,
      'character': instance.character,
      'order': instance.order,
      'profile_path': instance.profilePath,
    };
