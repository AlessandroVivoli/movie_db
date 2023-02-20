
import 'package:flutter/material.dart';

class ErrorSnackBarContent extends StatelessWidget {
  const ErrorSnackBarContent({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        const SizedBox(width: 10),
        Text(
          message,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
