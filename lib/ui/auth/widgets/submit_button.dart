import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../core/errors/invalid_user_error.dart';
import '../../../core/extensions/build_context_extensions.dart';

class SubmitButton extends ConsumerWidget {
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
    final auth = ref.watch(authProvider);

    ref.listen(
      authProvider,
      (previous, next) {
        next.whenOrNull(
          loggedIn: (user) {
            Navigator.pop(context, false);
          },
          error: (error, stack) {
            var message = context.locale.generalLoginErrorMessage;

            if (error is InvalidUserError) {
              message = context.locale.wrongCredentialsErrorMessage;
            }

            context.showErrorSnackBar(message);
          },
        );
      },
    );

    return auth.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      orElse: () => _Button(
        formKey: formKey,
        usernameController: usernameController,
        passwordController: passwordController,
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        if (!formKey.currentState!.validate()) {
          return;
        }

        ref.read(authProvider.notifier).login(
              usernameController.text,
              passwordController.text,
            );
      },
      child: Text(context.locale.loginSubmitButtonLabel),
    );
  }
}
