import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../features/movies/domain/backdrop_sizes_enum.dart';
import '../../../../../features/movies/domain/movie_list.dart';
import '../../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../../features/movies/provider/search_movies_provider.dart';
import '../../../../../features/tv_shows/provider/search_tv_shows_provider.dart';
import '../../../../../routing/routes.dart';
import '../../../../extensions/build_context_extensions.dart';
import '../../../custom_image/custom_network_image.dart';
import '../../../errors/error_text.dart';

class SuggestionList<T> extends ConsumerWidget {
  final String query;

  const SuggestionList({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (query.isEmpty) {
      return const Center();
    }

    final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user);
    late final AsyncValue search;

    if (T == MovieListModel) {
      search = ref.watch(
        searchMoviesProvider(
          query: query,
          includeAdult: user?.accountDetails.includeAdult ?? false,
        ),
      );
    } else {
      search = ref.watch(
        searchTVShowsProvider(
          query: query,
          includeAdult: user?.accountDetails.includeAdult ?? false,
        ),
      );
    }

    final localization = AppLocalizations.of(context)!;

    return search.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (model) {
        final list = model.results;

        if (list.isEmpty) {
          return Center(
            child: Text(
              localization.nothingFound,
            ),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  (T == MovieListModel) ? AppRoute.movie : AppRoute.tv,
                  arguments: list[index].id,
                );
              },
              title: Text(
                (T == MovieListModel) ? list[index].title! : list[index].name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 10),
                height: 60,
                child: Text(
                  list[index].overview!,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: .1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              minLeadingWidth: 70,
              leading: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomNetworkImage(
                    placeholderIcon: Icon(
                      (T == MovieListModel) ? Icons.movie : Icons.tv,
                    ),
                    url:
                        ref.read(movieImageServiceProvider).getMovieBackdropUrl(
                              size: BackdropSizes.w300,
                              path: list[index].backdropPath,
                            ),
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(
          T == MovieListModel
              ? localization.searchMoviesError
              : localization.searchTVShowsError,
        );

        return Center(
          child: ErrorText(localization.unexpectedErrorMessage),
        );
      },
    );
  }
}
