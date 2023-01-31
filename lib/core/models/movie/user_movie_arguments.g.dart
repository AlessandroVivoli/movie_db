// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_movie_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserMovieArguments _$$_UserMovieArgumentsFromJson(
        Map<String, dynamic> json) =>
    _$_UserMovieArguments(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      page: json['page'] as int? ?? 1,
    );

Map<String, dynamic> _$$_UserMovieArgumentsToJson(
        _$_UserMovieArguments instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'page': instance.page,
    };
