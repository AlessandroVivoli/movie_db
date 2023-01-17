import 'package:flutter/material.dart';

import '../../../../core/models/account/account_details.dart';

class LoggedInDrawerView extends StatelessWidget {
  const LoggedInDrawerView(
      {super.key, this.onLogout, required this.accountDetails});

  final void Function()? onLogout;
  final AccountDetails accountDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text('Hello ${accountDetails.name}'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.person),
          label: const Text('Profile'),
        ),
        TextButton.icon(
          onPressed: onLogout,
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ],
    );
  }
}
