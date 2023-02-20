import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../features/account/domain/account_details.dart';

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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        ListTile(
          title: Text(
            context.locale.helloLabel(accountDetails.username),
          ),
        ),
        OutlinedButton.icon(
          onPressed: onProfilePressed,
          icon: const Icon(Icons.person),
          label: Text(context.locale.profileButtonLabel),
        ),
        OutlinedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.logout),
          label: Text(context.locale.logoutButtonLabel),
        ),
      ],
    );
  }
}
