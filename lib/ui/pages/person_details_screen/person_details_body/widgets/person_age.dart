import 'package:flutter/material.dart';

class PersonAge extends StatelessWidget {
  const PersonAge({
    Key? key,
    required this.birthday,
  }) : super(key: key);

  final String? birthday;

  @override
  Widget build(BuildContext context) {
    final birthdayDate = DateTime.tryParse(birthday ?? '');
    final age = DateTime.now()
        .difference((birthdayDate != null) ? birthdayDate : DateTime.now());

    final ageString = (birthdayDate == null)
        ? 'No age recorded'
        : '${(age.inDays / 365).floor()}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Age'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ageString,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
