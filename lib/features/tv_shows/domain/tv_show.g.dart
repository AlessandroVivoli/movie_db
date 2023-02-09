// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVShow _$$_TVShowFromJson(Map<String, dynamic> json) => _$_TVShow(
      posterPath: json['poster_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      id: json['id'] as int,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      firstAirDate: _$JsonConverterFromJson<String, DateTime?>(
          json['first_air_date'], const DateTimeConverter().fromJson),
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      voteCount: json['vote_count'] as int,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
    );

Map<String, dynamic> _$$_TVShowToJson(_$_TVShow instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'first_air_date': const DateTimeConverter().toJson(instance.firstAirDate),
      'origin_country': instance.originCountry,
      'genre_ids': instance.genreIds,
      'vote_count': instance.voteCount,
      'name': instance.name,
      'original_name': instance.originalName,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
