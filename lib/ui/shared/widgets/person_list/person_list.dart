import 'package:flutter/cupertino.dart';

import '../../../../core/models/person/person.dart';
import '../person_card/person_card.dart';

class PersonList extends StatelessWidget {
  final List<Person> personList;

  const PersonList({super.key, required this.personList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: personList.length,
      itemBuilder: ((context, index) {
        return PersonCard(person: personList[index]);
      }),
    );
  }
}
