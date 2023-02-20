import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/auth/provider/auth_provider.dart';
import '../../../features/genre/provider/get_movie_genres_provider.dart';
import '../../extensions/build_context_extensions.dart';
import '../errors/error_text.dart';
import 'widgets/genre_tab_controller.dart';

class MovieGenreTab extends ConsumerWidget {
  const MovieGenreTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getMovieGenresProvider);

    final includeAdult = ref.watch(authProvider).maybeWhen(
          loggedIn: (user) => user.accountDetails.includeAdult,
          orElse: () => false,
        );

    return genres.when(
      data: (genreList) {
        if (genreList.isEmpty) {
          return Center(
            child: Text(context.locale.noMovieGenres),
          );
        }

        return GenreTabController(
          data: genreList,
          mediaType: 'movie',
          includeAdult: includeAdult,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getMovieGenresError);

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
