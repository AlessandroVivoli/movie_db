import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/models/auth/request_token.dart';
import '../../../core/models/auth/session_id.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/services/auth_service.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import 'widgets/password_text_field.dart';
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

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordNode = FocusNode();

    _formKey = GlobalKey();

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
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
                  _SubmitButton(
                    formKey: _formKey,
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    mounted: mounted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required this.mounted,
  })  : _formKey = formKey,
        _usernameController = usernameController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      onPressed: () async {
        if (!(_formKey.currentState?.validate() ?? false)) {
          return;
        }

        final token = await AuthService.createRequestToken().catchError((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: ErrorSnackBarContent(
                message: 'Could not get request token.',
              ),
            ),
          );

          return const RequestToken(
            success: false,
            expiresAt: '',
            requestToken: '',
          );
        });

        if (token.success) {
          final validatedToken = await AuthService.validateTokenWithLogin(
            requestToken: token.requestToken,
            username: _usernameController.text,
            password: _passwordController.text,
          ).catchError((error) {
            String message = 'Could not get session id';

            if (error is DioError && error.response?.statusCode == 401) {
              message = 'Wrong username and/or password';
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: ErrorSnackBarContent(
                  message: message,
                ),
              ),
            );

            return const RequestToken(
              success: false,
              expiresAt: '',
              requestToken: '',
            );
          });

          if (validatedToken.success && mounted) {
            _login(validatedToken.requestToken, context);
          }
        }
      },
      child: const Text('Submit'),
    );
  }

  void _login(String token, BuildContext context) async {
    final session = await AuthService.createSessionId(
      requestToken: token,
    ).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: ErrorSnackBarContent(message: 'Could not login'),
        ),
      );

      return const SessionId(success: false, sessionId: '');
    });

    if (session.success && mounted) {
      SessionProvider.setSession(session.sessionId);

      Navigator.pop(context);
    }
  }
}
