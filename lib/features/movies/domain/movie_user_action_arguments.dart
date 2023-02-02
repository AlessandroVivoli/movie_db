import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/auth/domain/user.dart';

part 'movie_user_action_arguments.freezed.dart';
part 'movie_user_action_arguments.g.dart';

@freezed
class MovieUserActionArguments with _$MovieUserActionArguments {
  const factory MovieUserActionArguments({
    required User user,
    required int movieId,
    required bool action,
  }) = _MovieUserActionArguments;

  factory MovieUserActionArguments.fromJson(Map<String, Object?> json) =>
      _$MovieUserActionArgumentsFromJson(json);
}
