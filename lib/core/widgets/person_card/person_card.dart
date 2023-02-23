import 'package:flutter/material.dart';

import 'widgets/person_card_wrapper.dart';

class PersonCard extends StatelessWidget {
  final double imgRadius;
  final double imgBorderWidth;

  final String? imageUrl;
  final String name;
  final String? department;

  final void Function()? onTap;

  const PersonCard({
    super.key,
    this.imgRadius = 40,
    this.imgBorderWidth = 2,
    this.onTap,
    required this.imageUrl,
    required this.name,
    this.department,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PersonCardWrapper(
        imgRadius: imgRadius,
        imageUrl: imageUrl,
        name: name,
        department: department,
      ),
    );
  }
}
