import 'package:freezed_annotation/freezed_annotation.dart';

part 'rated.freezed.dart';
part 'rated.g.dart';

@freezed
class Rated with _$Rated {
  const factory Rated({
    required double value,
  }) = _Rated;

  factory Rated.fromJson(Map<String, Object?> json) => _$RatedFromJson(json);
}
