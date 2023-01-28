import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/user_provider.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/favorite_movies_section.dart';
import 'widgets/rated_movies_section.dart';
import 'widgets/watchlist_section.dart';

class AccountDetailsWrapper extends HookConsumerWidget {
  const AccountDetailsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final reloadKey = useState(UniqueKey());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user!.accountDetails.name != null)
            AccountDetailsNameText(name: user.accountDetails.name!),
          FavoriteMoviesSection(
            accountDetails: user.accountDetails,
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
    );
  }
}
