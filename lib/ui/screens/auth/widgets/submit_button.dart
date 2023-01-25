import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/service_providers.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../shared/widgets/errors/error_snack_bar_content.dart';

class SubmitButton extends HookConsumerWidget {
  const SubmitButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    final isLoggingIn = useState(false);

    if (isLoggingIn.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      onPressed: () async {
        if (!(formKey.currentState?.validate() ?? false)) {
          return;
        }

        isLoggingIn.value = true;

        final response = await authService.login(
          username: usernameController.text,
          password: passwordController.text,
        );

        if (!response.success) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: ErrorSnackBarContent(
                    message: response.message,
                  ),
                ),
              );
          });

          isLoggingIn.value = false;

          return;
        }

        SessionProvider.setSession(response.sessionId!);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, false);
        });
      },
      child: const Text('Submit'),
    );
  }
}
