import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../core/providers/genre_provider.dart';
import '../errors/error_snack_bar_content.dart';
import '../errors/error_text.dart';
import 'widgets/genre_tab_controller.dart';

class GenreTab extends ConsumerWidget {
  const GenreTab({super.key, this.includeAdult});

  final bool? includeAdult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getGenresProvider);

    return genres.when(
      data: (genreList) {
        if (genreList.isEmpty) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return GenreTabController(data: genreList);
      },
      error: (error, stackTrace) {
        logError('Could not get genres.', error, stackTrace);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: const ErrorSnackBarContent(
                message: 'Could not get genres.',
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
