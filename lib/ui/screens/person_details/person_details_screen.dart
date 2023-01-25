import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../core/providers/person_provider.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
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
    Key? key,
    required this.personId,
  }) : super(key: key);

  final int personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personDetails = ref.watch(getPersonDetailsProvider(personId));

    return personDetails.when(
      data: (details) => PersonDetailsBody(personDetails: details),
      error: (error, stackTrace) {
        logError('Could not get person details', error, stackTrace);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: const ErrorSnackBarContent(
                message: 'Could not get person details.',
              ),
            ),
          );
        });

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
