import 'package:flutter/material.dart';

import '../../../../core/providers/session_provider.dart';
import '../../../../core/services/auth_service.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.onPressed,
    required this.onError,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  final void Function() onPressed;
  final void Function(String message) onError;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      onPressed: () async {
        if (!(formKey.currentState?.validate() ?? false)) {
          return;
        }

        final request = AuthService.login(
          username: usernameController.text,
          password: passwordController.text,
        );

        onPressed();

        final response = await request;

        if (!response.success) {
          return onError(response.message);
        }

        SessionProvider.setSession(response.sessionId!);

        onSubmit();
      },
      child: const Text('Submit'),
    );
  }
}
