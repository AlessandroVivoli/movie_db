import 'package:flutter/material.dart';

import '../../../../../core/models/account/account_details.dart';
import '../../../../../core/providers/session_provider.dart';
import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class FavoriteMoviesSection extends StatefulWidget {
  const FavoriteMoviesSection({
    Key? key,
    required this.accountDetails,
    this.onReturn,
  }) : super(key: key);

  final AccountDetails accountDetails;
  final void Function()? onReturn;

  @override
  State<FavoriteMoviesSection> createState() => _FavoriteMoviesSectionState();
}

class _FavoriteMoviesSectionState extends State<FavoriteMoviesSection> {
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
            child: FutureBuilder(
              future: MovieService.getFavoriteMovies(
                accountId: widget.accountDetails.id,
                sessionId: SessionProvider.sessionId!,
                page: _page,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.results.isEmpty) {
                    return const Center(
                      child: Text('Nothing found.'),
                    );
                  }

                  return PagedMovieList(
                    movieList: snapshot.data!,
                    onPageChanged: (page) {
                      setState(() {
                        _page = page;
                      });
                    },
                    refreshOnReturn: true,
                    onReturn: widget.onReturn,
                  );
                }

                if (snapshot.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: ErrorSnackBarContent(
                          message: 'Could not get favorite movies',
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
