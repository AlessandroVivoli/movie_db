import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../core/providers/person_provider.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/person_list/person_list.dart';

class MovieCasts extends StatelessWidget {
  const MovieCasts({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 10),
          child: Text(
            'Casts'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: _CastBuilder(details: details),
        ),
      ],
    );
  }
}

class _CastBuilder extends ConsumerWidget {
  const _CastBuilder({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cast = ref.watch(getCastProvider(details.id));

    return cast.when(
      data: (castList) {
        if (castList.isEmpty) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return PersonList(
          personList: castList,
          padding: 10,
        );
      },
      error: (error, stackTrace) {
        logError('Could not get cast.', error, stackTrace);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: const ErrorSnackBarContent(
                message: 'Could not get cast.',
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
    );
  }
}
