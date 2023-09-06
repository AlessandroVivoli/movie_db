import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_star.freezed.dart';
part 'guest_star.g.dart';

@freezed
class GuestStar with _$GuestStar {
  const factory GuestStar({
    required int id,
    required String name,
    required String creditId,
    required String character,
    required int order,
    required String? profilePath,
  }) = _GuestStar;

  factory GuestStar.fromJson(Map<String, Object?> json) =>
      _$GuestStarFromJson(json);
}
