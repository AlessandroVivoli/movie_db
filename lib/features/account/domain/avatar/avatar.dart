import 'package:freezed_annotation/freezed_annotation.dart';

import 'gravatar/gravatar.dart';
import 'tmdb/tmdb.dart';

part 'avatar.freezed.dart';
part 'avatar.g.dart';

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    required Gravatar gravatar,
    required TMDB tmdb,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, Object?> json) => _$AvatarFromJson(json);
}
