// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewListModel _$$_ReviewListModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewListModel(
      id: json['id'] as int?,
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$_ReviewListModelToJson(_$_ReviewListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
