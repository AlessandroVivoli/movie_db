import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/models/account/account_details.dart';
import '../../../../../core/models/movie/account_movie_arguments.dart';
import '../../../../../core/providers/local_storage_provider.dart';
import '../../../../../core/providers/movie_provider.dart';
import '../../../../../utils/extensions.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class FavoriteMoviesSection extends StatelessWidget {
  const FavoriteMoviesSection({
    super.key,
    required this.accountDetails,
    this.onReturn,
  });

  final AccountDetails accountDetails;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Movies',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 290,
            child: _FavoriteMoviesHookBuilder(
                accountDetails: accountDetails, onReturn: onReturn),
          ),
        ],
      ),
    );
  }
}

class _FavoriteMoviesHookBuilder extends HookConsumerWidget {
  const _FavoriteMoviesHookBuilder({
    required this.accountDetails,
    required this.onReturn,
  });

  final AccountDetails accountDetails;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    return Consumer(
      builder: (context, ref, child) {
        final sessionId = ref.watch(localStorageProvider)?.getSessionId();

        final favoriteMovies = ref.watch(
          getFavoriteMoviesProvider(
            AccountMovieArguments(
              accountId: accountDetails.id,
              sessionId: sessionId!,
              page: page.value,
            ),
          ),
        );

        return favoriteMovies.when(
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
            logError('Could not get favorite movies.', error, stackTrace);

            context.showErrorSnackBar('Could not get favorite movies.');

            return const Center(
              child: ErrorText('Something went wrong.'),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
