// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVEpisodeDetails _$$_TVEpisodeDetailsFromJson(Map<String, dynamic> json) =>
    _$_TVEpisodeDetails(
      airDate: _$JsonConverterFromJson<String, DateTime?>(
          json['air_date'], const DateTimeConverter().fromJson),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      episeodeNumber: json['episeode_number'] as int,
      guestStars: (json['guest_stars'] as List<dynamic>)
          .map((e) => GuestStar.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      productionCode: json['production_code'] as String?,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$$_TVEpisodeDetailsToJson(_$_TVEpisodeDetails instance) =>
    <String, dynamic>{
      'air_date': const DateTimeConverter().toJson(instance.airDate),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'episeode_number': instance.episeodeNumber,
      'guest_stars': instance.guestStars.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
