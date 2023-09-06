// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaArguments _$$_MediaArgumentsFromJson(Map<String, dynamic> json) =>
    _$_MediaArguments(
      withGenres:
          (json['with_genres'] as List<dynamic>).map((e) => e as int).toList(),
      sortBy: json['sort_by'] == null
          ? SortBy.popularityDesc
          : SortBy.fromJson(json['sort_by'] as Map<String, dynamic>),
      includeAdult: json['include_adult'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MediaArgumentsToJson(_$_MediaArguments instance) =>
    <String, dynamic>{
      'with_genres': instance.withGenres,
      'sort_by': instance.sortBy.toJson(),
      'include_adult': instance.includeAdult,
    };
