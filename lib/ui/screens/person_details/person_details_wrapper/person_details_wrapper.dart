import 'package:flutter/material.dart';

import '../../../../core/models/person/details/person_details.dart';
import 'widgets/person_age.dart';
import 'widgets/person_biography.dart';
import 'widgets/person_credits.dart';
import 'widgets/person_deparment.dart';
import 'widgets/person_lifetime.dart';

class PersonDetailsWrapper extends StatelessWidget {
  const PersonDetailsWrapper({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

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
