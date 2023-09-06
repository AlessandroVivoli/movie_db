import 'package:freezed_annotation/freezed_annotation.dart';

part 'crew.freezed.dart';
part 'crew.g.dart';

@freezed
class Crew with _$Crew {
  const factory Crew({
    required int id,
    required String creditId,
    required String name,
    required String department,
    required String job,
    required String? profilePath,
  }) = _Crew;

  factory Crew.fromJson(Map<String, Object?> json) => _$CrewFromJson(json);
}
