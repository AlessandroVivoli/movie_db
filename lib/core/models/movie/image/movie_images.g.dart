// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieImages _$$_MovieImagesFromJson(Map<String, dynamic> json) =>
    _$_MovieImages(
      backdrops: (json['backdrops'] as List<dynamic>)
          .map((e) => MovieImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>)
          .map((e) => MovieImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieImagesToJson(_$_MovieImages instance) =>
    <String, dynamic>{
      'backdrops': instance.backdrops.map((e) => e.toJson()).toList(),
      'posters': instance.posters.map((e) => e.toJson()).toList(),
    };
