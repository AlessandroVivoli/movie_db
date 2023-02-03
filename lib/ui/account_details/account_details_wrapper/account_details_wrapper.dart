import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../core/widgets/errors/error_text.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/favorite_movies_section.dart';
import 'widgets/rated_movies_section.dart';
import 'widgets/watchlist_section.dart';

class AccountDetailsWrapper extends HookConsumerWidget {
  const AccountDetailsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final localization = AppLocalizations.of(context)!;

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
      orElse: () => Center(
        child: ErrorText(localization.notLoggedInErrorMessage),
      ),
    );
  }
}
