import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/models/account/account_details.dart';
import '../../../../../core/providers/session_provider.dart';
import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class RatedMoviesSection extends HookWidget {
  const RatedMoviesSection(
      {super.key, required this.accountDetails, this.onReturn});

  final AccountDetails accountDetails;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context) {
    final page = useState(1);

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
            child: FutureBuilder(
              future: MovieService.getRatedMovies(
                accountId: accountDetails.id,
                sessionId: SessionProvider.sessionId!,
                page: page.value,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.totalResults == 0) {
                    return const Center(
                      child: Text('Nothing found.'),
                    );
                  }

                  return PagedMovieList(
                    movieList: snapshot.data!,
                    onPageChanged: (index) {
                      page.value = index;
                    },
                    refreshOnReturn: true,
                    onReturn: onReturn,
                  );
                }

                if (snapshot.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: ErrorSnackBarContent(
                          message: 'Could not get rated movies.',
                        ),
                      ),
                    );
                  });

                  return const Center(
                    child: ErrorText('Something went wrong.'),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
