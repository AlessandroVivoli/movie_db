// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieImage _$$_MovieImageFromJson(Map<String, dynamic> json) =>
    _$_MovieImage(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      filePath: json['file_path'] as String,
      height: json['height'] as int,
      iso_639_1: json['iso_639_1'] as String?,
      voteAverage: json['vote_average'] as int,
      voteCount: json['vote_count'] as int,
      width: json['width'] as int,
    );

Map<String, dynamic> _$$_MovieImageToJson(_$_MovieImage instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };