import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsernameTextField extends HookWidget {
  const UsernameTextField({
    super.key,
    required this.usernameController,
    required this.nextNode,
  });

  final TextEditingController usernameController;
  final FocusNode nextNode;

  @override
  Widget build(BuildContext context) {
    final currentNode = useFocusNode();

    final localization = AppLocalizations.of(context)!;

    final GlobalKey<FormFieldState> formFieldKey = GlobalKey();

    return TextFormField(
      key: formFieldKey,
      focusNode: currentNode,
      controller: usernameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${localization.fieldRequired} ${localization.usernameTextFieldLabel.toLowerCase()}';
        }

        return null;
      },
      onFieldSubmitted: (value) {
        formFieldKey.currentState?.validate();

        if (value.isEmpty) {
          return currentNode.requestFocus();
        }

        nextNode.requestFocus();
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text.rich(
          TextSpan(
            children: [
              const WidgetSpan(
                child: FaIcon(FontAwesomeIcons.solidCircleUser),
              ),
              const WidgetSpan(
                child: SizedBox(width: 5),
              ),
              TextSpan(text: localization.usernameTextFieldLabel),
            ],
          ),
        ),
      ),
    );
  }
}
