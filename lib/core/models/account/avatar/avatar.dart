import 'package:freezed_annotation/freezed_annotation.dart';

import 'gravatar/gravatar.dart';

part 'avatar.freezed.dart';
part 'avatar.g.dart';

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    required Gravatar gravatar,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, Object?> json) => _$AvatarFromJson(json);
}
