import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/password_text_field.dart';
import 'widgets/submit_button.dart';
import 'widgets/username_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: const Icon(Icons.keyboard_double_arrow_left),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: _FormWidgets(
                formKey: formKey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormWidgets extends HookWidget {
  const _FormWidgets({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController(text: null);
    final passwordController = useTextEditingController(text: null);
    final passwordNode = useFocusNode();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        UsernameTextField(
          usernameController: usernameController,
          nextNode: passwordNode,
        ),
        const SizedBox(height: 10),
        PasswordTextField(
          passwordController: passwordController,
          passwordNode: passwordNode,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: SubmitButton(
            formKey: formKey,
            usernameController: usernameController,
            passwordController: passwordController,
          ),
        ),
      ],
    );
  }
}
