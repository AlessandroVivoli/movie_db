import 'package:flutter/material.dart';

class PersonBiography extends StatelessWidget {
  const PersonBiography({
    Key? key,
    required this.biography,
  }) : super(key: key);

  final String biography;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biography'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          (biography.characters.isEmpty) ? 'No biography' : biography,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
