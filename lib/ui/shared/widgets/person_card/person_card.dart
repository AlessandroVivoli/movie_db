import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/person/person.dart';
import '../../../../core/providers/service_providers.dart';
import '../../../../utils/routes.dart';
import 'widgets/person_card_wrapper.dart';

class PersonCard extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.person,
          arguments: personService.getPersonDetails(id: person.id),
        );
      },
      child: PersonCardWrapper(imgRadius: imgRadius, person: person),
    );
  }
}
