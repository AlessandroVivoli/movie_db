// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Avatar _$$_AvatarFromJson(Map<String, dynamic> json) => _$_Avatar(
      gravatar: Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: TMDB.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AvatarToJson(_$_Avatar instance) => <String, dynamic>{
      'gravatar': instance.gravatar.toJson(),
      'tmdb': instance.tmdb.toJson(),
    };
