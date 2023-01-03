// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieImages _$$_MovieImagesFromJson(Map<String, dynamic> json) =>
    _$_MovieImages(
      backgdrops: (json['backgdrops'] as List<dynamic>)
          .map((e) => MovieImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>)
          .map((e) => MovieImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieImagesToJson(_$_MovieImages instance) =>
    <String, dynamic>{
      'backgdrops': instance.backgdrops,
      'posters': instance.posters,
    };
