import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonLifetime extends StatelessWidget {
  const PersonLifetime({
    Key? key,
    required this.birthday,
    this.deathday,
    this.extendedDate = false,
  }) : super(key: key);

  final String? birthday;
  final String? deathday;
  final bool extendedDate;

  @override
  Widget build(BuildContext context) {
    final birthdayDate = DateTime.tryParse(birthday ?? '');
    final deathdayDate = DateTime.tryParse(deathday ?? '');

    final String pattern = (extendedDate) ? 'yMMMMd' : 'yMMMd';

    final birthdayFormat =
        (birthdayDate == null) ? '?' : DateFormat(pattern).format(birthdayDate);
    final deathdayFormat =
        (deathdayDate == null) ? '?' : DateFormat(pattern).format(deathdayDate);

    final lifetimeFormat = (birthdayDate == null && deathdayDate == null)
        ? '?'
        : '$birthdayFormat - $deathdayFormat';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lifetime'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          lifetimeFormat,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
