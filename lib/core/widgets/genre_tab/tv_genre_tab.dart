import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/genre/provider/get_tv_genres_provider.dart';
import '../../extensions/build_context_extensions.dart';
import 'widgets/genre_tab_controller.dart';

class TVGenreTab extends ConsumerWidget {
  const TVGenreTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getTVGenresProvider);

    final localization = AppLocalizations.of(context)!;

    return genres.when(
      data: (genreList) {
        if (genreList.isEmpty) {
          return Center(child: Text(localization.noTVGenres));
        }

        return GenreTabController(data: genreList);
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getTVGenresError);

        return Center(
          child: Text(localization.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
