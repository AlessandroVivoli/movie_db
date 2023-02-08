// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numbered_episode_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NumberedEpisodeStatus _$$_NumberedEpisodeStatusFromJson(
        Map<String, dynamic> json) =>
    _$_NumberedEpisodeStatus(
      id: json['id'] as int,
      episodeNumber: json['episode_number'] as int,
      rated: json['rated'],
    );

Map<String, dynamic> _$$_NumberedEpisodeStatusToJson(
        _$_NumberedEpisodeStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'episode_number': instance.episodeNumber,
      'rated': instance.rated,
    };
