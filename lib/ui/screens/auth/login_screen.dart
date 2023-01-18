import 'package:flutter/material.dart';

import '../../shared/widgets/errors/error_snack_bar_content.dart';
import 'widgets/password_text_field.dart';
import 'widgets/submit_button.dart';
import 'widgets/username_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final FocusNode _passwordNode;

  late final GlobalKey<FormState> _formKey;

  late bool _isLoggingIn;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordNode = FocusNode();

    _isLoggingIn = false;

    _formKey = GlobalKey();

    super.initState();
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: const Icon(Icons.keyboard_double_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
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
                    usernameController: _usernameController,
                    nextNode: _passwordNode,
                  ),
                  const SizedBox(height: 10),
                  PasswordTextField(
                    passwordController: _passwordController,
                    passwordNode: _passwordNode,
                  ),
                  const SizedBox(height: 10),
                  if (!_isLoggingIn)
                    SizedBox(
                      height: 40,
                      child: SubmitButton(
                        formKey: _formKey,
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        onSubmit: () => Navigator.pop(context),
                        onPressed: () => setState(() {
                          _isLoggingIn = true;
                        }),
                        onError: (message) {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: ErrorSnackBarContent(
                                  message: message,
                                ),
                              ),
                            );

                          setState(() {
                            _isLoggingIn = false;
                          });
                        },
                      ),
                    ),
                  if (_isLoggingIn)
                    const SizedBox(
                      height: 40,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
