import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/person/domain/person_details.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../features/localization/provider/locale_state_provider.dart';

class PersonLifetime extends ConsumerWidget {
  const PersonLifetime({
    super.key,
    required this.personDetails,
    this.extendedDate = false,
  });

  final PersonDetails personDetails;

  final bool extendedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.personLifetimeLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          personDetails.getLifetime(extendedDate, locale.languageCode),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
