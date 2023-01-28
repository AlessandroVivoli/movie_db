import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/models/movie/account_movie_arguments.dart';
import '../../../../../core/models/user/user.dart';
import '../../../../../core/providers/movie_provider.dart';
import '../../../../../utils/extensions.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class RatedMoviesSection extends StatelessWidget {
  const RatedMoviesSection({super.key, required this.user, this.onReturn});

  final User user;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rated Movies',
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
              onReturn: onReturn,
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
    required this.onReturn,
  });

  final User user;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final ratedMovies = ref.watch(
      getRatedMoviesProvider(
        AccountMovieArguments(
          accountId: user.accountDetails.id,
          sessionId: user.sessionId,
          page: page.value,
        ),
      ),
    );

    return ratedMovies.when(
      data: (movies) {
        if (movies.totalResults == 0) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return PagedMovieList(
          movieList: movies,
          onPageChanged: (index) {
            page.value = index;
          },
          refreshOnReturn: true,
          onReturn: onReturn,
        );
      },
      error: (error, stackTrace) {
        logError('Could not get rated movies.', error, stackTrace);

        context.showErrorSnackBar('Could not get rated movies.');

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
