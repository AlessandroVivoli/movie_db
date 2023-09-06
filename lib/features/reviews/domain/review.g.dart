// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      author: json['author'] as String,
      authorDetails: ReviewAuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
      content: const _ContentConverter().fromJson(json['content'] as String),
      createdAt: _$JsonConverterFromJson<String, DateTime?>(
          json['created_at'], const DateTimeConverter().fromJson),
      id: json['id'] as String,
      updatedAt: _$JsonConverterFromJson<String, DateTime?>(
          json['updated_at'], const DateTimeConverter().fromJson),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'author': instance.author,
      'author_details': instance.authorDetails.toJson(),
      'content': const _ContentConverter().toJson(instance.content),
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
      'id': instance.id,
      'updated_at': const DateTimeConverter().toJson(instance.updatedAt),
      'url': instance.url,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
