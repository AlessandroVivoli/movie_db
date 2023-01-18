import 'package:flutter/material.dart';

import '../../../../../../core/models/account/account_details.dart';

class LoggedInDrawerView extends StatelessWidget {
  const LoggedInDrawerView(
      {super.key, this.onLogout, required this.accountDetails});

  final void Function()? onLogout;
  final AccountDetails accountDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        ListTile(
          title: Text('Hello, ${accountDetails.username}'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.person),
          label: const Text('Profile'),
        ),
        OutlinedButton.icon(
          onPressed: onLogout,
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ],
    );
  }
}