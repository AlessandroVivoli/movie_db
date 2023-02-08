// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVEpisode _$$_TVEpisodeFromJson(Map<String, dynamic> json) => _$_TVEpisode(
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodeNumber: json['episode_number'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$$_TVEpisodeToJson(_$_TVEpisode instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
