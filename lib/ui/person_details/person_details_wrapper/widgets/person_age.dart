import 'package:flutter/material.dart';

import '../../../../../features/person/domain/person_details.dart';
import '../../../../core/extensions/build_context_extensions.dart';

class PersonAge extends StatelessWidget {
  const PersonAge({
    super.key,
    required this.personDetails,
  });

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.personAgeLabel.toUpperCase(),
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
