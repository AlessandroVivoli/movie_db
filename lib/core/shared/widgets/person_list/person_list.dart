import 'package:flutter/cupertino.dart';

import '../../../../features/person/domain/person.dart';
import '../person_card/person_card.dart';

class PersonList extends StatelessWidget {
  final List<Person> personList;
  final double? padding;

  const PersonList({super.key, required this.personList, this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: personList.length,
      itemBuilder: ((context, index) {
        return PersonCard(person: personList[index]);
      }),
    );
  }
}
