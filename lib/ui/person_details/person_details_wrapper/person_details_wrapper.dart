import 'package:flutter/material.dart';

import '../../../../features/person/domain/person_details.dart';
import 'widgets/person_age.dart';
import 'widgets/person_biography.dart';
import 'widgets/person_credits.dart';
import 'widgets/person_deparment.dart';
import 'widgets/person_lifetime.dart';

class PersonDetailsWrapper extends StatelessWidget {
  const PersonDetailsWrapper({
    super.key,
    required this.personDetails,
  });

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonAge(
                personDetails: personDetails,
              ),
              PersonLifetime(
                personDetails: personDetails,
              ),
              PersonDepartment(department: personDetails.knownForDepartment!),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PersonBiography(biography: personDetails.biography!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PersonCredits(id: personDetails.id),
        ),
      ],
    );
  }
}
