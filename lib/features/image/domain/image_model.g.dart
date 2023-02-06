// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageModel _$$_ImageModelFromJson(Map<String, dynamic> json) =>
    _$_ImageModel(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      filePath: json['file_path'] as String,
      height: json['height'] as int,
      iso_639_1: json['iso_639_1'] as String?,
      voteAverage: json['vote_average'] as int,
      voteCount: json['vote_count'] as int,
      width: json['width'] as int,
    );

Map<String, dynamic> _$$_ImageModelToJson(_$_ImageModel instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
