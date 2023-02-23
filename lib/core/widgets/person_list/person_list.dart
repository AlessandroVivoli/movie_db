import 'package:flutter/cupertino.dart';

import '../person_card/person_card.dart';

class PersonList extends StatelessWidget {
  final int length;
  final double? padding;

  final String? Function(int index) imageBuilder;
  final String Function(int index) nameBuilder;
  final String? Function(int index) departmentBuilder;

  const PersonList({
    super.key,
    this.padding,
    required this.length,
    required this.imageBuilder,
    required this.nameBuilder,
    required this.departmentBuilder,
  });

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
      itemCount: length,
      itemBuilder: (context, index) {
        return PersonCard(
          imageUrl: imageBuilder(index),
          name: nameBuilder(index),
          department: departmentBuilder(index),
        );
      },
    );
  }
}
