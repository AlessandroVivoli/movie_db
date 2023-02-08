// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVSeason _$$_TVSeasonFromJson(Map<String, dynamic> json) => _$_TVSeason(
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodeCount: json['episode_count'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      seasonNumber: json['season_number'] as int,
    );

Map<String, dynamic> _$$_TVSeasonToJson(_$_TVSeason instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
    };
