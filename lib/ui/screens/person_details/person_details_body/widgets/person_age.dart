import 'package:flutter/material.dart';

import '../../../../../core/models/person/details/person_details.dart';

class PersonAge extends StatelessWidget {
  const PersonAge({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Age'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          personDetails.age,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
