import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../features/account/domain/account_details.dart';

class LoggedInDrawerView extends StatelessWidget {
  const LoggedInDrawerView({
    super.key,
    this.onPressed,
    this.onProfilePressed,
    required this.accountDetails,
  });

  final void Function()? onPressed;
  final void Function()? onProfilePressed;
  final AccountDetails accountDetails;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        ListTile(
          title: Text(
            localization.helloLabel(accountDetails.username),
          ),
        ),
        OutlinedButton.icon(
          onPressed: onProfilePressed,
          icon: const Icon(Icons.person),
          label: Text(localization.profileButtonLabel),
        ),
        OutlinedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.logout),
          label: Text(localization.logoutButtonLabel),
        ),
      ],
    );
  }
}
