import 'package:flutter/material.dart';

import '../widgets/errors/error_snack_bar_content.dart';

extension ShowSnackBar on BuildContext {
  void showSimpleSnackBar(String text) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    });
  }

  void showErrorSnackBar(String error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: ErrorSnackBarContent(message: error),
          ),
        );
    });
  }
}
