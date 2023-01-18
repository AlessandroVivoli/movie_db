import 'package:flutter/material.dart';

import '../../../../../../utils/routes.dart';

class LoggedOutDrawerView extends StatelessWidget {
  final void Function()? onLogin;

  const LoggedOutDrawerView({super.key, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        OutlinedButton.icon(
          onPressed: () =>
              Navigator.pushNamed(context, AppRoute.login).then((_) {
            if (onLogin != null) onLogin!();
          }),
          icon: const Icon(Icons.login),
          label: const Text('Login'),
        ),
      ],
    );
  }
}
