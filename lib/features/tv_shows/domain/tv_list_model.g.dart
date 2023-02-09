// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TVListModel _$$_TVListModelFromJson(Map<String, dynamic> json) =>
    _$_TVListModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TVShow.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$_TVListModelToJson(_$_TVListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
