import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../routing/routes.dart';

class LoggedOutDrawerView extends ConsumerWidget {
  final void Function()? onLogin;

  const LoggedOutDrawerView({super.key, this.onLogin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

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
          label: Text(localization.loginButtonLabel),
        ),
      ],
    );
  }
}
