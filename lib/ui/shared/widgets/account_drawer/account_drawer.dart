import 'package:flutter/material.dart';

import '../../../../core/models/account/account_details.dart';
import '../../../../utils/routes.dart';
import 'widgets/logged_in_drawer_view/logged_in_drawer_view.dart';
import 'widgets/logged_out_drawer_view/logged_out_drawer_view.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({
    super.key,
    this.accountDetails,
    this.onLogin,
    this.onLogout,
  });

  final AccountDetails? accountDetails;
  final void Function()? onLogin;
  final void Function()? onLogout;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (accountDetails == null)
          ? LoggedOutDrawerView(
              onLogin: onLogin,
            )
          : LoggedInDrawerView(
              accountDetails: accountDetails!,
              onLogout: onLogout,
              onProfilePressed: () => Navigator.of(context).pushNamed(
                AppRoute.account,
                arguments: accountDetails!,
              ),
            ),
    );
  }
}
