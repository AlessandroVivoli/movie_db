import 'package:freezed_annotation/freezed_annotation.dart';

class VoteAverageConverter implements JsonConverter<double, num?> {
  const VoteAverageConverter();

  @override
  double fromJson(num? json) {
    return json?.toDouble() ?? 0;
  }

  @override
  num toJson(double object) {
    return object;
  }
}
