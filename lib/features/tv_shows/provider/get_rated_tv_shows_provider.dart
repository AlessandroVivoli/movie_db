import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../account/provider/account_service_provider.dart';
import '../../auth/provider/auth_provider.dart';
import '../domain/tv_list_model.dart';

part 'get_rated_tv_shows_provider.g.dart';

@riverpod
Future<TVListModel> getRatedTVShows(GetRatedTVShowsRef ref, {int page = 1}) {
  final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user)!;

  return ref
      .read(accountServiceProvider)
      .getRatedTVShows(accountId: user.accountDetails.id, page: page);
}
