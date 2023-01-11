import 'package:flutter/material.dart';

import '../../../../../core/models/person/details/person_details.dart';
import '../widgets/person_age.dart';
import '../widgets/person_deparment.dart';
import '../widgets/person_lifetime.dart';
import '../widgets/person_name.dart';
import '../widgets/person_profile.dart';

class LandscapeLayout extends StatelessWidget {
  final PersonDetails personDetails;

  const LandscapeLayout({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonProfile(
              profilePath: personDetails.profilePath,
              width: 150,
              margin: const EdgeInsets.only(right: 10),
            ),
            SizedBox(
              width: 400,
              child: Column(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PersonAge(birthday: personDetails.birthday),
                        PersonDepartment(
                          department: personDetails.knownForDepartment!,
                        ),
                      ],
                    ),
                  ),
                  PersonLifetime(
                    birthday: personDetails.birthday,
                    deathday: personDetails.deathdday,
                    extendedDate: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
