import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_movie_arguments.freezed.dart';
part 'account_movie_arguments.g.dart';

@freezed
class AccountMovieArguments with _$AccountMovieArguments {
  const factory AccountMovieArguments({
    required int accountId,
    required String sessionId,
    required int page,
  }) = _AccountMovieArguments;

  factory AccountMovieArguments.fromJson(Map<String, Object?> json) =>
      _$AccountMovieArgumentsFromJson(json);
}
