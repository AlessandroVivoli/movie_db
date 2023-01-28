import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../core/providers/person_provider.dart';
import '../../../utils/extensions.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'person_details_body/person_details_body.dart';

class PersonDetailsScreen extends StatelessWidget {
  final int personId;

  const PersonDetailsScreen({super.key, required this.personId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _PersonDetailsBodyBuilder(personId: personId),
      ),
    );
  }
}

class _PersonDetailsBodyBuilder extends ConsumerWidget {
  const _PersonDetailsBodyBuilder({
    required this.personId,
  });

  final int personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personDetails = ref.watch(getPersonDetailsProvider(personId));

    return personDetails.when(
      data: (details) => PersonDetailsBody(personDetails: details),
      error: (error, stackTrace) {
        logError('Could not get person details', error, stackTrace);

        context.showErrorSnackBar('Could not get person details.');

        return Column(
          children: [
            AppBar(),
            const Center(
              child: ErrorText('Something went wrong.'),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
