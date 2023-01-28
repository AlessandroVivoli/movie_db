import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/error/invalid_user_error.dart';
import '../../../../core/providers/auth_provider.dart';
import '../../../../core/providers/user_provider.dart';
import '../../../../utils/extensions.dart';

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

    return auth.when(
      loggedIn: (user) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(userProvider.notifier).state = user;

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
        var message = 'Could not login.';

        if (error is InvalidUserError) {
          message = 'Wrong username and/or password';
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
      child: const Text('Submit'),
    );
  }
}
