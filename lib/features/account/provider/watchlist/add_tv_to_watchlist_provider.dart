import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../tv_shows/provider/get_tv_details_provider.dart';
import '../../domain/account_media_state.dart';
import '../account_service_provider.dart';
import 'get_tv_watchlist_provider.dart';

part 'add_tv_to_watchlist_provider.g.dart';

@riverpod
class TVWatchlist extends _$TVWatchlist {
  @override
  AccountMediaState build() => const AccountMediaState.success();

  void addTVToWatchlist({required int tvId, required bool watchlist}) async {
    state = const AccountMediaState.loading();

    state = await _addTVToWatchlist(tvId: tvId, watchlist: watchlist)
        .then((_) => const AccountMediaState.success())
        .catchError(AccountMediaState.error);

    ref.invalidate(getTVDetailsProvider(tvId));
    ref.invalidate(getTVWatchlistProvider);
  }

  Future<void> _addTVToWatchlist({required int tvId, required bool watchlist}) {
    final user = ref.read(authProvider).whenOrNull(loggedIn: (user) => user)!;

    return ref.read(accountServiceProvider).addToWatchlist(
          accountId: user.accountDetails.id,
          mediaId: tvId,
          mediaType: 'tv',
          watchlist: watchlist,
        );
  }
}
