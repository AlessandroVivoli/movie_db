import '../../auth/domain/user.dart';
import 'account_details.dart';

abstract class IAccountService {
  /// Returns [AccountDetails] future using the valid session id.
  Future<AccountDetails> getAccountDetails({required String sessionId});

  /// Marks the movie favorite if the [favorite] is true.
  ///
  /// Returns the status code of the api response.
  Future<int> markMovieAsFavorite({
    required User user,
    required int movieId,
    required bool favorite,
  });

  /// Adds movie to the watchlist if the [watchlist] is true.
  ///
  /// Returns the status code of the api response.
  Future<int> addMovieToWatchList({
    required User user,
    required int movieId,
    required bool watchlist,
  });
}
