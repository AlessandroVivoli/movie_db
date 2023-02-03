import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../features/movies/domain/movie_list.dart';
import '../../../../../features/movies/provider/search_movies_provider.dart';
import '../../../errors/error_text.dart';
import '../../../movie_card/movie_card.dart';

class ResultList extends HookConsumerWidget {
  final String query;

  const ResultList({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final includeAdult = ref
            .watch(authProvider)
            .whenOrNull(loggedIn: (user) => user.accountDetails.includeAdult) ??
        false;
    final search = ref.watch(
      searchMoviesProvider(
        query: query,
        includeAdult: includeAdult,
        page: page.value,
      ),
    );

    final localization = AppLocalizations.of(context)!;

    return search.when(
      data: (data) {
        final list = data.results;

        if (list.isEmpty) {
          return Column(
            children: const [
              Center(
                child: Text('No movies found.'),
              ),
            ],
          );
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  textDirection: TextDirection.ltr,
                  children: List.generate(
                    list.length,
                    (index) {
                      return Container(
                        width: 120,
                        height: 250,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: MovieCard(movie: list[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
            _Paginator(page: page, data: data),
          ],
        );
      },
      error: (_, __) => Center(
        child: ErrorText(localization.unexpectedErrorMessage),
      ),
      loading: () {
        return Column(
          children: [
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),
            _Paginator(
              page: page,
              data: const MovieListModel(
                page: 1,
                results: [],
                totalPages: 0,
                totalResults: 0,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Paginator extends HookWidget {
  const _Paginator({
    required this.page,
    required this.data,
  });

  final ValueNotifier<int> page;
  final MovieListModel data;

  @override
  Widget build(BuildContext context) {
    final currentPage = useState(page.value);

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: (currentPage.value != 1)
                ? () {
                    currentPage.value--;
                    page.value--;
                  }
                : null,
          ),
          Text('${page.value}'),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: (currentPage.value != data.totalPages)
                ? () {
                    currentPage.value++;
                    page.value++;
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
