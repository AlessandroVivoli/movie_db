import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/auth_provider.dart';
import '../../../shared/widgets/errors/error_text.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/favorite_movies_section.dart';
import 'widgets/rated_movies_section.dart';
import 'widgets/watchlist_section.dart';

class AccountDetailsWrapper extends HookConsumerWidget {
  const AccountDetailsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final reloadKey = useState(UniqueKey());

    return user.maybeWhen(
      loggedIn: (user) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user.accountDetails.name != null)
              AccountDetailsNameText(name: user.accountDetails.name!),
            FavoriteMoviesSection(
              user: user,
              onReturn: () => (reloadKey.value = UniqueKey()),
            ),
            WatchlistSection(
              user: user,
              onReturn: () => (reloadKey.value = UniqueKey()),
            ),
            RatedMoviesSection(
              user: user,
              onReturn: () => (reloadKey.value = UniqueKey()),
            ),
          ],
        ),
      ),
      orElse: () => const Center(
        child: ErrorText('You\'re not logged in.'),
      ),
    );
  }
}
