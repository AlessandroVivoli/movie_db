import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/domain/user.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/paged_movie_list/paged_movie_list.dart';
import '../../../../features/account/provider/get_rated_movies_provider.dart';

class RatedMoviesSection extends StatelessWidget {
  const RatedMoviesSection({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.ratedMoviesSectionTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 290,
            child: _RatedMoviesHookWidget(
              user: user,
            ),
          ),
        ],
      ),
    );
  }
}

class _RatedMoviesHookWidget extends HookConsumerWidget {
  const _RatedMoviesHookWidget({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final ratedMovies = ref.watch(
      getRatedMoviesProvider(page: page.value),
    );

    return ratedMovies.when(
      data: (movies) {
        if (movies.totalResults == 0) {
          return Center(
            child: Text(context.locale.noRated),
          );
        }

        return PagedMovieList(
          movieList: movies,
          onPageChanged: (index) {
            page.value = index;
          },
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getRatedError);

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
