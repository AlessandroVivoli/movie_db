// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestToken _$$_RequestTokenFromJson(Map<String, dynamic> json) =>
    _$_RequestToken(
      success: json['success'] as bool,
      expiresAt: json['expires_at'] as String,
      requestToken: json['request_token'] as String,
    );

Map<String, dynamic> _$$_RequestTokenToJson(_$_RequestToken instance) =>
    <String, dynamic>{
      'success': instance.success,
      'expires_at': instance.expiresAt,
      'request_token': instance.requestToken,
    };
