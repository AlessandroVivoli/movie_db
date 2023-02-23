import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/movie_card/movie_card.dart';
import '../../../../core/widgets/tv_card/tv_card.dart';
import '../../../../features/auth/provider/auth_provider.dart';
import '../../../../features/media/domain/i_media_image_service.dart';
import '../../../../features/movies/domain/movie_list.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../features/movies/provider/search_movies_provider.dart';
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

    IMediaImageService imageService;

    late final AsyncValue search;

    if (isMovie) {
      search = ref.watch(
        searchMoviesProvider(
          query: query,
          includeAdult: includeAdult,
          page: page.value,
        ),
      );

      imageService = ref.watch(movieImageServiceProvider);
    } else {
      search = ref.watch(
        searchTVShowsProvider(
          query: query,
          includeAdult: includeAdult,
          page: page.value,
        ),
      );

      imageService = ref.watch(tvImageServiceProvider);
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
          imageService: imageService,
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
    required this.imageService,
    required this.page,
    required this.data,
  });

  final List list;
  final bool isMovie;
  final IMediaImageService imageService;
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
                    imageService: imageService,
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
    required this.imageService,
    required this.index,
  });

  final bool isMovie;
  final List list;
  final IMediaImageService imageService;
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
          ? MovieCard(
              movie: list[index],
              imageUrl: imageService.getMediaPosterUrl(
                size: PosterSizes.w154,
                path: list[index].posterPath,
              ),
              onTap: () => list[index].id,
            )
          : TVCard(
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
            ),
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
