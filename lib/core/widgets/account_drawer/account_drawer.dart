import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/auth/provider/auth_provider.dart';
import '../../../routing/routes.dart';
import 'widgets/logged_in_drawer_view/logged_in_drawer_view.dart';
import 'widgets/logged_out_drawer_view/logged_out_drawer_view.dart';

class AccountDrawer extends HookConsumerWidget {
  const AccountDrawer({
    super.key,
    this.onLogin,
  });
  final void Function()? onLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final widget = useState<Widget>(const LoggedOutDrawerView());

    user.whenOrNull<void>(
      loggedIn: (user) {
        widget.value = LoggedInDrawerView(
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
        );
      },
      loggedOut: () {
        widget.value = const LoggedOutDrawerView();
      },
    );

    return SafeArea(child: widget.value);
  }
}
