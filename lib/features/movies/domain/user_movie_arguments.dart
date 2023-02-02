import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/auth/domain/user.dart';

part 'user_movie_arguments.freezed.dart';
part 'user_movie_arguments.g.dart';

@freezed
class UserMovieArguments with _$UserMovieArguments {
  const factory UserMovieArguments({
    required User user,
    @Default(1) int page,
  }) = _UserMovieArguments;

  factory UserMovieArguments.fromJson(Map<String, Object?> json) =>
      _$UserMovieArgumentsFromJson(json);
}
