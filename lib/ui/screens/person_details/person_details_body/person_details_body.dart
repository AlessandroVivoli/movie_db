import 'package:flutter/material.dart';

import '../../../../core/models/person/details/person_details.dart';
import 'landscape_layout/landscape_layout.dart';
import 'portrait_layout/portrait_layout.dart';
import 'widgets/person_biography.dart';
import 'widgets/person_credits.dart';

class PersonDetailsBody extends StatelessWidget {
  final PersonDetails personDetails;

  const PersonDetailsBody({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: (orientation == Orientation.landscape)
                  ? LandscapeLayout(personDetails: personDetails)
                  : PortraitLayout(personDetails: personDetails),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: PersonBiography(biography: personDetails.biography!),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: PersonCredits(id: personDetails.id),
            ),
          ],
        ),
      ),
    );
  }
}
