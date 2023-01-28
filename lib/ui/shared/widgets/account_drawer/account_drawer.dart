import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/auth_provider.dart';
import '../../../../core/providers/user_provider.dart';
import '../../../../utils/routes.dart';
import 'widgets/logged_in_drawer_view/logged_in_drawer_view.dart';
import 'widgets/logged_out_drawer_view/logged_out_drawer_view.dart';

class AccountDrawer extends ConsumerWidget {
  const AccountDrawer({
    super.key,
    this.onLogin,
  });
  final void Function()? onLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return SafeArea(
      child: (user != null)
          ? LoggedInDrawerView(
              accountDetails: user.accountDetails,
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              onProfilePressed: () {
                Scaffold.of(context).closeDrawer();

                Navigator.of(context).pushNamed(
                  AppRoute.account,
                  arguments: user.accountDetails,
                );
              },
            )
          : LoggedOutDrawerView(
              onLogin: () {
                if (onLogin != null) {
                  onLogin!();
                }
              },
            ),
    );
  }
}
