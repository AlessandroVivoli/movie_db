import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/genre/provider/get_genres_provider.dart';
import '../../extensions.dart';
import '../errors/error_text.dart';
import 'widgets/genre_tab_controller.dart';

class GenreTab extends ConsumerWidget {
  const GenreTab({super.key, this.includeAdult});
  final bool? includeAdult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getGenresProvider);

    final localization = AppLocalizations.of(context)!;

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
        context.showErrorSnackBar('Could not get genres.');

        return Center(
          child: ErrorText(localization.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
