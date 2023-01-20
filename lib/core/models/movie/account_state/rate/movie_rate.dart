import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_rate.freezed.dart';
part 'movie_rate.g.dart';

@freezed
class MovieRate with _$MovieRate {
  const factory MovieRate({
    required double value,
  }) = _MovieRate;

  factory MovieRate.fromJson(Map<String, Object?> json) =>
      _$MovieRateFromJson(json);
}
