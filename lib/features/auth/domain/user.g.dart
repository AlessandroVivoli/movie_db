// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      accountDetails: AccountDetails.fromJson(
          json['account_details'] as Map<String, dynamic>),
      sessionId: json['session_id'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'account_details': instance.accountDetails.toJson(),
      'session_id': instance.sessionId,
    };
