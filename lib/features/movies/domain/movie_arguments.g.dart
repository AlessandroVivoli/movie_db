// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieArguments _$$_MovieArgumentsFromJson(Map<String, dynamic> json) =>
    _$_MovieArguments(
      withGenres: (json['with_genres'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      sortBy: json['sort_by'] == null
          ? SortBy.popularityDesc
          : SortBy.fromJson(json['sort_by'] as Map<String, dynamic>),
      includeAdult: json['include_adult'] as bool?,
    );

Map<String, dynamic> _$$_MovieArgumentsToJson(_$_MovieArguments instance) =>
    <String, dynamic>{
      'with_genres': instance.withGenres,
      'sort_by': instance.sortBy.toJson(),
      'include_adult': instance.includeAdult,
    };
