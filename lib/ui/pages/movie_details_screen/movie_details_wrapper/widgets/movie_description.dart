import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  final String description;

  const MovieDescription(this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Text(description),
        ),
      ],
    );
  }
}
