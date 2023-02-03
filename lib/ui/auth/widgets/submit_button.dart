import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../core/errors/invalid_user_error.dart';
import '../../../core/extensions.dart';

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

    final localization = AppLocalizations.of(context)!;

    return auth.when(
      loggedIn: (user) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, false);
        });

        return _Button(
          formKey: formKey,
          usernameController: usernameController,
          passwordController: passwordController,
        );
      },
      loggedOut: () {
        return _Button(
          formKey: formKey,
          usernameController: usernameController,
          passwordController: passwordController,
        );
      },
      error: (error, stack) {
        var message = localization.generalLoginErrorMessage;

        if (error is InvalidUserError) {
          message = localization.wrongCredentialsErrorMessage;
        }

        context.showErrorSnackBar(message);

        return _Button(
          formKey: formKey,
          usernameController: usernameController,
          passwordController: passwordController,
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
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
    final localization = AppLocalizations.of(context)!;

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
      child: Text(localization.loginSubmitButtonLabel),
    );
  }
}
