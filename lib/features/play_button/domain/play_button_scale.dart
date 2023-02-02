import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_button_scale.freezed.dart';
part 'play_button_scale.g.dart';

@freezed
class PlayButtonScale with _$PlayButtonScale {
  const factory PlayButtonScale({
    required double top,
    required double offset,
    required double scale,
  }) = _PlayButtonScale;

  factory PlayButtonScale.fromJson(Map<String, Object?> json) =>
      _$PlayButtonScaleFromJson(json);
}
