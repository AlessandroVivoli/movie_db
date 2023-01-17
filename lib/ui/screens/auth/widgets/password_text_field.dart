import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.passwordNode,
  });

  final TextEditingController passwordController;
  final FocusNode passwordNode;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late final GlobalKey<FormFieldState> _formFieldKey;

  @override
  void initState() {
    _formFieldKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formFieldKey,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password field is required!';
        }

        return null;
      },
      focusNode: widget.passwordNode,
      controller: widget.passwordController,
      onFieldSubmitted: (value) {
        _formFieldKey.currentState?.validate();

        if (value.isEmpty) {
          widget.passwordNode.requestFocus();
        }
      },
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(child: FaIcon(FontAwesomeIcons.lock)),
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(text: 'Password'),
            ],
          ),
        ),
      ),
    );
  }
}
