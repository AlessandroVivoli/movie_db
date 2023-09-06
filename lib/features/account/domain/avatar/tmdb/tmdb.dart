import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmdb.freezed.dart';
part 'tmdb.g.dart';

@freezed
class TMDB with _$TMDB {
  const factory TMDB({
    required String? avatarPath,
  }) = _TMDB;

  factory TMDB.fromJson(Map<String, Object?> json) => _$TMDBFromJson(json);
}
