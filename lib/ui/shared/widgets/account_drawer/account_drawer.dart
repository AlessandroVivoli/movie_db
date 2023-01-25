import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/general_providers.dart';
import '../../../../core/providers/service_providers.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../utils/routes.dart';
import '../errors/error_snack_bar_content.dart';
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
    final accountDetails = ref.watch(accountDetailsStateProvider);
    final authService = ref.watch(authServiceProvider);
    final accountService = ref.watch(accountServiceProvider);

    return SafeArea(
      child: (accountDetails == null)
          ? LoggedOutDrawerView(
              onLogin: () async {
                final accountDetails = await accountService.getAccountDetails(
                  sessionId: SessionProvider.sessionId!,
                );

                ref.read(accountDetailsStateProvider.notifier).state =
                    accountDetails;

                if (onLogin != null) onLogin!();
              },
            )
          : LoggedInDrawerView(
              accountDetails: accountDetails,
              onLogout: () async {
                bool success = await authService.logout(
                  sessionId: SessionProvider.sessionId!,
                );

                ref.read(accountDetailsStateProvider.notifier).state = null;
                SessionProvider.deleteSession();

                if (!success) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: ErrorSnackBarContent(
                          message: 'Could not logout.',
                        ),
                      ),
                    );
                  });
                }
              },
              onProfilePressed: () {
                Scaffold.of(context).closeDrawer();

                Navigator.of(context).pushNamed(
                  AppRoute.account,
                  arguments: accountDetails,
                );
              },
            ),
    );
  }
}
