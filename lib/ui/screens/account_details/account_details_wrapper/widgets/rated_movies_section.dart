import 'package:flutter/material.dart';

import '../../../../../core/models/account/account_details.dart';
import '../../../../../core/providers/session_provider.dart';
import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class RatedMoviesSection extends StatefulWidget {
  const RatedMoviesSection(
      {super.key, required this.accountDetails, this.onReturn});

  final AccountDetails accountDetails;
  final void Function()? onReturn;

  @override
  State<RatedMoviesSection> createState() => _RatedMoviesSectionState();
}

class _RatedMoviesSectionState extends State<RatedMoviesSection> {
  late int _page;

  @override
  void initState() {
    _page = 1;

    super.initState();
  }

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
            child: FutureBuilder(
              future: MovieService.getRatedMovies(
                accountId: widget.accountDetails.id,
                sessionId: SessionProvider.sessionId!,
                page: _page,
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
                    onPageChanged: (page) => setState(() {
                      _page = page;
                    }),
                    refreshOnReturn: true,
                    onReturn: widget.onReturn,
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
