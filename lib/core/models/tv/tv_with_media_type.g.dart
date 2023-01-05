// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_with_media_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVWithMediaType _$$_TVWithMediaTypeFromJson(Map<String, dynamic> json) =>
    _$_TVWithMediaType(
      posterPath: json['poster_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      id: json['id'] as int,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      mediaType: json['media_type'] as String,
      firstAirDate: json['first_air_date'] as String,
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String,
      voteCount: json['vote_count'] as int,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
    );

Map<String, dynamic> _$$_TVWithMediaTypeToJson(_$_TVWithMediaType instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'id': instance.id,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'media_type': instance.mediaType,
      'first_air_date': instance.firstAirDate,
      'origin_country': instance.originCountry,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'name': instance.name,
      'original_name': instance.originalName,
    };
