// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVSeason _$$_TVSeasonFromJson(Map<String, dynamic> json) => _$_TVSeason(
      airDate: _$JsonConverterFromJson<String, DateTime?>(
          json['air_date'], const DateTimeConverter().fromJson),
      episodeCount: json['episode_count'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      seasonNumber: json['season_number'] as int,
    );

Map<String, dynamic> _$$_TVSeasonToJson(_$_TVSeason instance) =>
    <String, dynamic>{
      'air_date': const DateTimeConverter().toJson(instance.airDate),
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
