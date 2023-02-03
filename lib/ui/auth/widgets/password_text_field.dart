import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.passwordNode,
  });

  final TextEditingController passwordController;
  final FocusNode passwordNode;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final GlobalKey<FormFieldState> formFieldKey = GlobalKey();

    return TextFormField(
      key: formFieldKey,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${localization.fieldRequired} ${localization.passwordTextFieldLabel.toLowerCase()}';
        }

        return null;
      },
      focusNode: passwordNode,
      controller: passwordController,
      onFieldSubmitted: (value) {
        formFieldKey.currentState?.validate();

        if (value.isEmpty) {
          passwordNode.requestFocus();
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text.rich(
          TextSpan(
            children: [
              const WidgetSpan(child: FaIcon(FontAwesomeIcons.lock)),
              const WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(text: localization.passwordTextFieldLabel),
            ],
          ),
        ),
      ),
    );
  }
}
