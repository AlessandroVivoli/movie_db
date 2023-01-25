import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/providers/movie_provider.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class PersonCredits extends StatelessWidget {
  const PersonCredits({
    Key? key,
    required this.id,
  }) : super(key: key);

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
  const _CreditsList({
    Key? key,
    required this.personId,
  }) : super(key: key);

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
          logError('Could not get movie credits.', error, stackTrace);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const ErrorSnackBarContent(
                  message: 'Could not get movie credits.',
                ),
              ),
            );
          });

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
