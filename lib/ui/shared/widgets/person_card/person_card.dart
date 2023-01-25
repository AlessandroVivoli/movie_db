import 'package:flutter/material.dart';

import '../../../../core/models/person/person.dart';
import '../../../../utils/routes.dart';
import 'widgets/person_card_wrapper.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  final double imgRadius;
  final double imgBorderWidth;

  const PersonCard({
    super.key,
    required this.person,
    this.imgRadius = 40,
    this.imgBorderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.person,
          arguments: person.id,
        );
      },
      child: PersonCardWrapper(imgRadius: imgRadius, person: person),
    );
  }
}
