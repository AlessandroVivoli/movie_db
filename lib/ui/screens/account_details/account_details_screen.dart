import 'package:flutter/material.dart';

import '../../../core/models/account/account_details.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key, required this.accountDetails});

  final AccountDetails accountDetails;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
