// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_movie_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountMovieArguments _$$_AccountMovieArgumentsFromJson(
        Map<String, dynamic> json) =>
    _$_AccountMovieArguments(
      accountId: json['account_id'] as int,
      sessionId: json['session_id'] as String,
      page: json['page'] as int,
    );

Map<String, dynamic> _$$_AccountMovieArgumentsToJson(
        _$_AccountMovieArguments instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'session_id': instance.sessionId,
      'page': instance.page,
    };
