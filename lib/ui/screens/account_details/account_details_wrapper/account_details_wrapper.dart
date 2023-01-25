import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/models/account/account_details.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/favorite_movies_section.dart';
import 'widgets/rated_movies_section.dart';
import 'widgets/watchlist_section.dart';

class AccountDetailsWrapper extends HookWidget {
  const AccountDetailsWrapper({super.key, required this.accountDetails});

  final AccountDetails accountDetails;

  @override
  Widget build(BuildContext context) {
    final reloadKey = useState(UniqueKey());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (accountDetails.name != null)
            AccountDetailsNameText(name: accountDetails.name!),
          FavoriteMoviesSection(
            accountDetails: accountDetails,
            onReturn: () => (reloadKey.value = UniqueKey()),
          ),
          WatchlistSection(
            accountDetails: accountDetails,
            onReturn: () => (reloadKey.value = UniqueKey()),
          ),
          RatedMoviesSection(
            accountDetails: accountDetails,
            onReturn: () => (reloadKey.value = UniqueKey()),
          ),
        ],
      ),
    );
  }
}
