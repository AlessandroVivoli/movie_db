import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/auth/provider/auth_provider.dart';
import '../../../features/genre/provider/get_tv_genres_provider.dart';
import '../../extensions/build_context_extensions.dart';
import 'widgets/genre_tab_controller.dart';

class TVGenreTab extends ConsumerWidget {
  const TVGenreTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getTVGenresProvider);

    final includeAdult = ref.watch(authProvider).maybeWhen(
          loggedIn: (user) => user.accountDetails.includeAdult,
          orElse: () => false,
        );

    return SizedBox(
      height: 300,
      child: genres.when(
        data: (genreList) {
          if (genreList.isEmpty) {
            return Center(child: Text(context.locale.noTVGenres));
          }

          return GenreTabController(
            data: genreList,
            mediaType: 'tv',
            includeAdult: includeAdult,
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(context.locale.getTVGenresError);

          return Center(
            child: Text(context.locale.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
