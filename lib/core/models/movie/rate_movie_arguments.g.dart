// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_movie_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RateMovieArguments _$$_RateMovieArgumentsFromJson(
        Map<String, dynamic> json) =>
    _$_RateMovieArguments(
      movieId: json['movie_id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RateMovieArgumentsToJson(
        _$_RateMovieArguments instance) =>
    <String, dynamic>{
      'movie_id': instance.movieId,
      'user': instance.user.toJson(),
      'rating': instance.rating,
    };
