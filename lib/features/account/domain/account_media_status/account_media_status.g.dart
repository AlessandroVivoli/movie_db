// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_media_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountMediaStatus _$$_AccountMediaStatusFromJson(
        Map<String, dynamic> json) =>
    _$_AccountMediaStatus(
      id: json['id'] as int?,
      favorite: json['favorite'] as bool,
      rated: json['rated'],
      watchlist: json['watchlist'] as bool,
    );

Map<String, dynamic> _$$_AccountMediaStatusToJson(
        _$_AccountMediaStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favorite': instance.favorite,
      'rated': instance.rated,
      'watchlist': instance.watchlist,
    };
