import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.red),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
