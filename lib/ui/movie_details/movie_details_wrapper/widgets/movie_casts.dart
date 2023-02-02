import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions.dart';
import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/person_list/person_list.dart';
import '../../../../features/movies/domain/movie_details.dart';
import '../../../../features/person/provider/get_cast_provider.dart';

class MovieCasts extends StatelessWidget {
  const MovieCasts({
    super.key,
    required this.details,
  });

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
          child: _CastList(details: details),
        ),
      ],
    );
  }
}

class _CastList extends ConsumerWidget {
  const _CastList({
    required this.details,
  });

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
        context.showErrorSnackBar('Could not get cast.');

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