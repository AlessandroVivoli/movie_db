import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';

class AccountDetailsNameText extends StatelessWidget {
  const AccountDetailsNameText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.accountRealName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
