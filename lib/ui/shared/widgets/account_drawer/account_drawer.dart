import 'package:flutter/material.dart';

import '../../../../core/providers/session_provider.dart';
import '../../../../core/services/account_service.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../utils/routes.dart';
import '../errors/error_snack_bar_content.dart';
import 'logged_in_drawer_view.dart';

class AccountDrawer extends StatefulWidget {
  const AccountDrawer({super.key});

  @override
  State<AccountDrawer> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends State<AccountDrawer> {
  final String? _sessionId = SessionProvider.sessionId;

  @override
  Widget build(BuildContext context) {
    if (_sessionId == null) {
      return SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              textColor: Theme.of(context).colorScheme.primary,
              iconColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.pushNamed(context, AppRoute.login)
                    .then((value) => setState(() {}));
              },
              title: const Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.login)),
                    WidgetSpan(
                        child: SizedBox(
                      width: 10,
                    )),
                    TextSpan(text: 'Login'),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return FutureBuilder(
        future: AccountService.getAccountDetails(sessionId: _sessionId!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoggedInDrawerView(
              accountDetails: snapshot.data!,
              onLogout: () async {
                bool success = await AuthService.logout(sessionId: _sessionId!);

                if (success) {
                  setState(() {
                    SessionProvider.deleteSession();
                  });
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: ErrorSnackBarContent(
                          message: 'Could not logout.',
                        ),
                      ),
                    );
                  }
                }
              },
            );
          } else if (snapshot.hasError) {}

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          );
        },
      );
    }
  }
}
