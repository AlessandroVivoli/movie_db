// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_author_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewAuthorDetails _$$_ReviewAuthorDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewAuthorDetails(
      name: json['name'] as String,
      username: json['username'] as String,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ReviewAuthorDetailsToJson(
        _$_ReviewAuthorDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
