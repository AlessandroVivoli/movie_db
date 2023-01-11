import 'package:flutter/material.dart';

import '../../../../../core/models/person/details/person_details.dart';
import '../widgets/person_age.dart';
import '../widgets/person_deparment.dart';
import '../widgets/person_lifetime.dart';
import '../widgets/person_name.dart';
import '../widgets/person_profile.dart';

class PortraitLayout extends StatelessWidget {
  final PersonDetails personDetails;

  const PortraitLayout({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: PersonName(
            name: personDetails.name,
            imdbId: personDetails.imdbId,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: PersonProfile(
              profilePath: personDetails.profilePath,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonAge(birthday: personDetails.birthday),
              PersonLifetime(
                birthday: personDetails.birthday,
                deathday: personDetails.deathdday,
              ),
              PersonDepartment(department: personDetails.knownForDepartment!),
            ],
          ),
        ),
      ],
    );
  }
}
