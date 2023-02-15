import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../tv_shows/domain/tv_list_model.dart';
import '../account_service_provider.dart';

part 'get_favorite_tv_shows_provider.g.dart';

@riverpod
Future<TVListModel> getFavoriteTVShows(
  GetFavoriteTVShowsRef ref, {
  int page = 1,
}) {
  final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user)!;

  return ref.read(accountServiceProvider).getFavoriteTVShows(
        accountId: user.accountDetails.id,
        page: page,
      );
}
