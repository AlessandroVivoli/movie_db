import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../../core/shared/widgets/errors/error_text.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/favorite_movies_section.dart';
import 'widgets/rated_movies_section.dart';
import 'widgets/watchlist_section.dart';

class AccountDetailsWrapper extends HookConsumerWidget {
  const AccountDetailsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

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
            ),
            WatchlistSection(
              user: user,
            ),
            RatedMoviesSection(
              user: user,
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
