import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/movie_list/movie_list.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../features/person/provider/get_person_credits_provider.dart';
import '../../../../routing/routes.dart';

class PersonCredits extends StatelessWidget {
  const PersonCredits({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.personCreditsLabel.toUpperCase(),
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
  const _CreditsList({required this.personId});

  final int personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credits = ref.watch(getPersonCreditsProvider(personId));

    final imageService = ref.watch(movieImageServiceProvider);

    return SizedBox(
      height: 250,
      child: credits.when(
        data: (movies) {
          if (movies.isEmpty) {
            return Center(
              child: Text(context.locale.noMovieCredits),
            );
          }

          return MovieList(
            imageBuilder: (index) => imageService.getMediaPosterUrl(
              size: PosterSizes.w154,
              path: movies[index].posterPath,
            ),
            onCardTap: (index) => Navigator.pushNamed(
              context,
              AppRoute.movie,
              arguments: movies[index].id,
            ),
            length: movies.length,
            averageVoteBuilder: (index) => movies[index].voteAverage,
            isAdultBuilder: (index) => movies[index].adult,
            titleBuilder: (index) => movies[index].title,
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(context.locale.getMovieCreditsError);

          return Center(
            child: ErrorText(context.locale.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
