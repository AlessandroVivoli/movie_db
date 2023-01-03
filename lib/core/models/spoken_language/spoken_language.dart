import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_language.freezed.dart';
part 'spoken_language.g.dart';

@freezed
class SpokenLanguage with _$SpokenLanguage {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory SpokenLanguage({
    required String? iso_649_1,
    required String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, Object?> json) =>
      _$SpokenLanguageFromJson(json);
}
