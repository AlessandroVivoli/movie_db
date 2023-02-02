import 'package:flutter/material.dart';

import '../../../../features/person/domain/person_details.dart';
import '../person_details_wrapper/person_details_wrapper.dart';
import 'widgets/person_details_carousel.dart';

class PersonDetailsBody extends StatelessWidget {
  final PersonDetails personDetails;

  const PersonDetailsBody({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PersonDetailsCarousel(personDetails: personDetails),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PersonDetailsWrapper(personDetails: personDetails),
          ),
        )
      ],
    );
  }
}
