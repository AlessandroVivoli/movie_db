import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/providers/auth_provider.dart';
import '../../../../../../core/providers/image_provider.dart';
import '../../../../../../core/providers/movie_provider.dart';
import '../../../../../../utils/enums.dart';
import '../../../../../../utils/extensions.dart';
import '../../../../../../utils/routes.dart';
import '../../../custom_image/custom_network_image.dart';
import '../../../errors/error_text.dart';

class SuggestionList extends ConsumerWidget {
  final String query;

  const SuggestionList({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (query.isEmpty) {
      return const Center();
    }

    final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user);
    final search = ref.watch(
      searchMoviesProvider(
        query: query,
        includeAdult: user?.accountDetails.includeAdult ?? false,
      ),
    );

    return search.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (model) {
        final list = model.results;

        if (list.isEmpty) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoute.movie,
                  arguments: list[index].id,
                );
              },
              title: Text(
                list[index].title!,
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
                    placeholderIcon: const Icon(Icons.movie),
                    url: ref.read(imageServiceProvider).getImageUrl(
                          size: BackdropSizes.original.name,
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
        context.showErrorSnackBar('Could not search for movies.');

        return const Center(
          child: ErrorText('Something went wrong.'),
        );
      },
    );
  }
}
