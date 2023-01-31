// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_user_action_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieUserActionArguments _$$_MovieUserActionArgumentsFromJson(
        Map<String, dynamic> json) =>
    _$_MovieUserActionArguments(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      movieId: json['movie_id'] as int,
      action: json['action'] as bool,
    );

Map<String, dynamic> _$$_MovieUserActionArgumentsToJson(
        _$_MovieUserActionArguments instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'movie_id': instance.movieId,
      'action': instance.action,
    };
