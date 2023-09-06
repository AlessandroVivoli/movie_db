import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_creator.freezed.dart';
part 'tv_show_creator.g.dart';

@freezed
class TVShowCreator with _$TVShowCreator {
  const factory TVShowCreator({
    required int id,
    required String creditId,
    required String name,
    required int gender,
    required String? profilePath,
  }) = _TVShowCreator;

  factory TVShowCreator.fromJson(Map<String, Object?> json) =>
      _$TVShowCreatorFromJson(json);
}
