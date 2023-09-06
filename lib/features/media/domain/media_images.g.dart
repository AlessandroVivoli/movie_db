// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaImages _$$_MediaImagesFromJson(Map<String, dynamic> json) =>
    _$_MediaImages(
      id: json['id'] as int,
      backdrops: (json['backdrops'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MediaImagesToJson(_$_MediaImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrops': instance.backdrops.map((e) => e.toJson()).toList(),
      'posters': instance.posters.map((e) => e.toJson()).toList(),
    };
