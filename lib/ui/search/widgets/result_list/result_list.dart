import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/movie_card/movie_card.dart';
import '../../../../core/widgets/tv_card/tv_card.dart';
import '../../../../features/auth/provider/auth_provider.dart';
import '../../../../features/movies/domain/movie.dart';
import '../../../../features/movies/domain/movie_list.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../features/movies/provider/search_movies_provider.dart';
import '../../../../features/tv_shows/domain/tv_show.dart';
import '../../../../features/tv_shows/provider/search_tv_shows_provider.dart';
import '../../../../features/tv_shows/provider/tv_image_service_provider.dart';
import '../../../../routing/routes.dart';

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

        return _ResultColumn(
          list: list,
          isMovie: isMovie,
          page: page,
          data: data,
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

class _ResultColumn extends StatelessWidget {
  const _ResultColumn({
    required this.list,
    required this.isMovie,
    required this.page,
    required this.data,
  });

  final List list;
  final bool isMovie;
  final ValueNotifier<int> page;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              textDirection: TextDirection.ltr,
              children: List.generate(
                list.length,
                (index) {
                  return _Result(
                    isMovie: isMovie,
                    list: list,
                    index: index,
                  );
                },
              ),
            ),
          ),
        ),
        _Paginator(page: page, totalPages: data.totalPages),
      ],
    );
  }
}

class _Result extends StatelessWidget {
  const _Result({
    required this.isMovie,
    required this.list,
    required this.index,
  });

  final bool isMovie;
  final List list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 250,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: (isMovie)
          ? _MovieCard(list: list as List<Movie>, index: index)
          : _TVCard(list: list as List<TVShow>, index: index),
    );
  }
}

class _TVCard extends ConsumerWidget {
  const _TVCard({
    required this.list,
    required this.index,
  });

  final List<TVShow> list;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(tvImageServiceProvider);

    return TVCard(
      imageUrl: imageService.getMediaPosterUrl(
        size: PosterSizes.w154,
        path: list[index].posterPath,
      ),
      onTap: () => Navigator.pushNamed(
        context,
        AppRoute.tv,
        arguments: list[index].id,
      ),
      adult: list[index].adult,
      name: list[index].name,
      voteAverage: list[index].voteAverage,
    );
  }
}

class _MovieCard extends ConsumerWidget {
  const _MovieCard({
    required this.list,
    required this.index,
  });

  final List<Movie> list;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(movieImageServiceProvider);

    return MovieCard(
      imageUrl: imageService.getMediaPosterUrl(
        size: PosterSizes.w154,
        path: list[index].posterPath,
      ),
      onTap: () => list[index].id,
      adult: list[index].adult,
      title: list[index].title,
      voteAverage: list[index].voteAverage,
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
