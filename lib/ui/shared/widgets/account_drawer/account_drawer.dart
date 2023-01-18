import 'package:flutter/material.dart';

import '../../../../core/providers/session_provider.dart';
import 'widgets/logged_in_drawer_view/widgets/logged_in_drawer_view_builder.dart';
import 'widgets/logged_out_drawer_view/logged_out_drawer_view.dart';

class AccountDrawer extends StatefulWidget {
  const AccountDrawer({super.key});

  @override
  State<AccountDrawer> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends State<AccountDrawer> {
  late String? _sessionId;

  @override
  void initState() {
    _sessionId = SessionProvider.sessionId;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_sessionId == null) {
      return SafeArea(
        child: LoggedOutDrawerView(
          onLogin: onLogin,
        ),
      );
    }

    return SafeArea(
      child: (_sessionId == null)
          ? LoggedOutDrawerView(
              onLogin: onLogin,
            )
          : LoggedInDrawerViewBuilder(
              sessionId: _sessionId!,
              onLogout: () {
                setState(() {
                  _sessionId = null;
                });
              },
              onLogin: onLogin,
            ),
    );
  }

  void onLogin() {
    setState(() {
      _sessionId = SessionProvider.sessionId;
      Scaffold.of(context).closeDrawer();
    });
  }
}
