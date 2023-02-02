import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_dot_scale.freezed.dart';
part 'active_dot_scale.g.dart';

@freezed
class ActiveDotScale with _$ActiveDotScale {
  const factory ActiveDotScale({
    required double dotComposite,
    required double left,
  }) = _ActiveDotScale;

  factory ActiveDotScale.fromJson(Map<String, Object?> json) =>
      _$ActiveDotScaleFromJson(json);
}
