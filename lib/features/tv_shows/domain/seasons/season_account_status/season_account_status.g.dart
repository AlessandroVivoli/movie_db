// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_account_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SeasonAccountStatus _$$_SeasonAccountStatusFromJson(
        Map<String, dynamic> json) =>
    _$_SeasonAccountStatus(
      id: json['id'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => NumberedEpisodeStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SeasonAccountStatusToJson(
        _$_SeasonAccountStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
