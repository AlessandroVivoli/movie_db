import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../features/movies/domain/movie_list.dart';
import '../../../../../features/movies/provider/search_movies_provider.dart';
import '../../../../../features/tv_shows/provider/search_tv_shows_provider.dart';
import '../../../../extensions/build_context_extensions.dart';
import '../../../errors/error_text.dart';
import '../../../movie_card/movie_card.dart';
import '../../../tv_card/tv_card.dart';

class ResultList<T> extends HookConsumerWidget {
  final String query;

  const ResultList({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final includeAdult = ref
            .watch(authProvider)
            .whenOrNull(loggedIn: (user) => user.accountDetails.includeAdult) ??
        false;

    final isMovie = T == MovieListModel;

    late final AsyncValue search;

    if (isMovie) {
      search = ref.watch(
        searchMoviesProvider(
          query: query,
          includeAdult: includeAdult,
          page: page.value,
        ),
      );
    } else {
      search = ref.watch(
        searchTVShowsProvider(
          query: query,
          includeAdult: includeAdult,
          page: page.value,
        ),
      );
    }

    return search.when(
      data: (data) {
        final list = data.results as List;

        if (list.isEmpty) {
          return Center(
            child: Text(
              textAlign: TextAlign.center,
              isMovie
                  ? context.locale.noMovieSearchResult
                  : context.locale.noTvSearchResult,
            ),
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
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: (isMovie)
                            ? MovieCard(movie: list[index])
                            : TVCard(tvShow: list[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
            _Paginator(page: page, totalPages: data.totalPages),
          ],
        );
      },
      error: (_, __) => Center(
        child: ErrorText(context.locale.unexpectedErrorMessage),
      ),
      loading: () {
        return Column(
          children: [
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            _Paginator(page: page, totalPages: 0),
          ],
        );
      },
    );
  }
}

class _Paginator extends HookWidget {
  const _Paginator({
    required this.page,
    required this.totalPages,
  });

  final ValueNotifier<int> page;
  final int totalPages;

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
            onPressed: (currentPage.value != totalPages)
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
