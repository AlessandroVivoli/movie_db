// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVSeasonDetails _$$_TVSeasonDetailsFromJson(Map<String, dynamic> json) =>
    _$_TVSeasonDetails(
      seasonId: json['_id'] as String,
      airDate: _$JsonConverterFromJson<String, DateTime?>(
          json['air_date'], const DateTimeConverter().fromJson),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => TVEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int,
    );

Map<String, dynamic> _$$_TVSeasonDetailsToJson(_$_TVSeasonDetails instance) =>
    <String, dynamic>{
      '_id': instance.seasonId,
      'air_date': const DateTimeConverter().toJson(instance.airDate),
      'episodes': instance.episodes.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
