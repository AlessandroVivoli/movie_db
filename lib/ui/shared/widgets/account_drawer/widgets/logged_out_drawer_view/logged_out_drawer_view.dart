import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/providers/auth_provider.dart';
import '../../../../../../utils/routes.dart';

class LoggedOutDrawerView extends ConsumerWidget {
  final void Function()? onLogin;

  const LoggedOutDrawerView({super.key, this.onLogin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        OutlinedButton.icon(
          onPressed: () => Navigator.pushNamed(context, AppRoute.login).then(
            (isCancel) {
              if (!(isCancel as bool? ?? true)) {
                if (onLogin != null) {
                  onLogin!();
                }
              } else {
                ref.invalidate(authProvider);
              }
            },
          ),
          icon: const Icon(Icons.login),
          label: const Text('Login'),
        ),
      ],
    );
  }
}
