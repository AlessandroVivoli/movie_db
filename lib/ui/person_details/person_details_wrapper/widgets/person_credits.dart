import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/movie_list/movie_list.dart';
import '../../../../features/movies/provider/get_person_credits_provider.dart';

class PersonCredits extends StatelessWidget {
  const PersonCredits({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.personCreditsLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        _CreditsList(personId: id)
      ],
    );
  }
}

class _CreditsList extends ConsumerWidget {
  const _CreditsList({required this.personId});

  final int personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credits = ref.watch(getPersonCreditsProvider(personId));

    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      height: 250,
      child: credits.when(
        data: (movies) {
          if (movies.isEmpty) {
            return Center(
              child: Text(localization.noMovieCredits),
            );
          }

          return MovieList(movieList: movies);
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(localization.getMovieCreditsError);

          return Center(
            child: ErrorText(localization.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
