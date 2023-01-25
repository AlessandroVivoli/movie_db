import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/models/account/account_details.dart';
import '../../../../../core/models/movie/account_movie_arguments.dart';
import '../../../../../core/providers/movie_provider.dart';
import '../../../../../core/providers/session_provider.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class WatchlistSection extends StatelessWidget {
  const WatchlistSection({
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
            'Watchlist',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 290,
            child: _WatchlistHookWidget(
              accountDetails: accountDetails,
              onReturn: onReturn,
            ),
          ),
        ],
      ),
    );
  }
}

class _WatchlistHookWidget extends HookConsumerWidget {
  const _WatchlistHookWidget({
    Key? key,
    required this.accountDetails,
    required this.onReturn,
  }) : super(key: key);

  final AccountDetails accountDetails;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final movieWatchlist = ref.watch(
      getMovieWatchlistProvider(
        AccountMovieArguments(
          accountId: accountDetails.id,
          sessionId: SessionProvider.sessionId!,
          page: page.value,
        ),
      ),
    );

    return movieWatchlist.when(
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
        logError('Could not get movie watchlist.', error, stackTrace);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: ErrorSnackBarContent(
                message: 'Could not get movie watchlist.',
              ),
            ),
          );
        });

        return const Center(
          child: ErrorText('Something went wrong'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
