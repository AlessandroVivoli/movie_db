import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/providers/movie_provider.dart';
import '../../../../../utils/extensions.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class PersonCredits extends StatelessWidget {
  const PersonCredits({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credits'.toUpperCase(),
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

    return SizedBox(
      height: 250,
      child: credits.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(
              child: Text('Nothing found.'),
            );
          }

          return MovieList(movieList: movies);
        },
        error: (error, stackTrace) {
          

          context.showErrorSnackBar('Could not get movie credits.');

          return const Center(
            child: ErrorText('Something went wrong.'),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
