import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({
    super.key,
    required this.usernameController,
    required this.nextNode,
  });

  final TextEditingController usernameController;
  final FocusNode nextNode;

  @override
  State<UsernameTextField> createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  late final FocusNode _currentNode;
  late final GlobalKey<FormFieldState> _formFieldKey;

  @override
  void initState() {
    _currentNode = FocusNode();
    _formFieldKey = GlobalKey();

    super.initState();
  }

  @override
  void dispose() {
    _currentNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formFieldKey,
      focusNode: _currentNode,
      controller: widget.usernameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username field is required!';
        }

        return null;
      },
      onFieldSubmitted: (value) {
        _formFieldKey.currentState?.validate();

        if (value.isEmpty) {
          return _currentNode.requestFocus();
        }

        widget.nextNode.requestFocus();
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: FaIcon(FontAwesomeIcons.solidCircleUser),
              ),
              WidgetSpan(
                child: SizedBox(width: 5),
              ),
              TextSpan(text: 'Username'),
            ],
          ),
        ),
      ),
    );
  }
}
