import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/auth/domain/user.dart';

part 'rate_movie_arguments.freezed.dart';
part 'rate_movie_arguments.g.dart';

@freezed
class RateMovieArguments with _$RateMovieArguments {
  const factory RateMovieArguments({
    required int movieId,
    required User user,
    required double rating,
  }) = _RateMovieArguments;

  factory RateMovieArguments.fromJson(Map<String, Object?> json) =>
      _$RateMovieArgumentsFromJson(json);
}
