import 'package:flutter/material.dart';

import '../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../core/services/account_service.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../errors/error_snack_bar_content.dart';
import '../../logged_out_drawer_view/logged_out_drawer_view.dart';
import '../logged_in_drawer_view.dart';

class LoggedInDrawerViewBuilder extends StatelessWidget {
  final String sessionId;

  final void Function()? onLogout;
  final void Function()? onLogin;

  const LoggedInDrawerViewBuilder({
    super.key,
    required this.sessionId,
    this.onLogout,
    this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AccountService.getAccountDetails(sessionId: sessionId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LoggedInDrawerView(
            accountDetails: snapshot.data!,
            onLogout: () => logout(
              context: context,
              sessionId: sessionId,
            ),
          );
        }

        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ErrorSnackBarContent(
                  message: 'Could not get account details.',
                ),
              ),
            );
          });

          return LoggedOutDrawerView(onLogin: onLogin);
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [CircularProgressIndicator()],
        );
      },
    );
  }

  void logout({
    required BuildContext context,
    required String sessionId,
  }) async {
    bool success = await AuthService.logout(sessionId: sessionId);

    if (success) {
      SessionProvider.deleteSession();
      return onLogout!();
    }

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
}
