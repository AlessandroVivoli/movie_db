import 'package:flutter/material.dart';

import '../../../../../core/models/person/details/person_details.dart';

class PersonLifetime extends StatelessWidget {
  const PersonLifetime({
    super.key,
    required this.personDetails,
    this.extendedDate = false,
  });

  final PersonDetails personDetails;

  final bool extendedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lifetime'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          personDetails.getLifetime(extendedDate),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
