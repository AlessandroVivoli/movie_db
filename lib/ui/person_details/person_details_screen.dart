import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../features/person/provider/get_person_credits_provider.dart';
import '../../features/person/provider/get_person_details_provider.dart';
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

    final localization = AppLocalizations.of(context)!;

    return personDetails.when(
      data: (details) => RefreshIndicator(
          onRefresh: () => Future(() {
                ref.invalidate(getPersonDetailsProvider(personId));
                ref.invalidate(getPersonCreditsProvider(personId));
              }),
          child: PersonDetailsBody(personDetails: details)),
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getPersonDetailsError);

        return Column(
          children: [
            AppBar(),
            Center(
              child: ErrorText(localization.unexpectedErrorMessage),
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
