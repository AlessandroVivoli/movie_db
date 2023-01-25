import '../models/account/account_details.dart';

abstract class IAccountService {
  /// Returns [AccountDetails] future using the valid session id.
  Future<AccountDetails> getAccountDetails({required String sessionId});

  /// Marks the movie favorite if the [favorite] is true.
  ///
  /// Returns the status code of the api response.
  Future<int> markMovieAsFavorite({
    required int accountId,
    required int movieId,
    required String sessionId,
    required bool favorite,
  });

  /// Adds movie to the watchlist if the [watchlist] is true.
  ///
  /// Returns the status code of the api response.
  Future<int> addMovieToWatchList({
    required int accountId,
    required int movieId,
    required String sessionId,
    required bool watchlist,
  });
}
