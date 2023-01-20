import 'package:flutter/material.dart';

import '../../../../core/models/account/account_details.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/favorite_movies_section.dart';
import 'widgets/rated_movies_section.dart';
import 'widgets/watchlist_section.dart';

class AccountDetailsWrapper extends StatefulWidget {
  const AccountDetailsWrapper({super.key, required this.accountDetails});

  final AccountDetails accountDetails;

  @override
  State<AccountDetailsWrapper> createState() => _AccountDetailsWrapperState();
}

class _AccountDetailsWrapperState extends State<AccountDetailsWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.accountDetails.name != null)
            AccountDetailsNameText(name: widget.accountDetails.name!),
          FavoriteMoviesSection(
            accountDetails: widget.accountDetails,
            onReturn: () => setState(() {}),
          ),
          WatchlistSection(
            accountDetails: widget.accountDetails,
            onReturn: () => setState(() {}),
          ),
          RatedMoviesSection(
            accountDetails: widget.accountDetails,
            onReturn: () => setState(() {}),
          ),
        ],
      ),
    );
  }
}
