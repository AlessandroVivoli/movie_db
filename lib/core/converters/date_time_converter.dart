import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String json) {
    if (json.isEmpty) return null;

    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime? object) {
    return (object != null) ? object.toIso8601String() : '';
  }
}
