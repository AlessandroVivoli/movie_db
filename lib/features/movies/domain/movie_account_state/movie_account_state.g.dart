// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_account_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieAccountState _$$_MovieAccountStateFromJson(Map<String, dynamic> json) =>
    _$_MovieAccountState(
      id: json['id'] as int,
      favorite: json['favorite'] as bool,
      rated: json['rated'],
      watchlist: json['watchlist'] as bool,
    );

Map<String, dynamic> _$$_MovieAccountStateToJson(
        _$_MovieAccountState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favorite': instance.favorite,
      'rated': instance.rated,
      'watchlist': instance.watchlist,
    };
