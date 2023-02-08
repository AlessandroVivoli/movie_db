import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../../core/widgets/errors/error_text.dart';
import '../../../core/widgets/genre_tab/movie_genre_tab.dart';
import '../../../features/movies/provider/get_trending_movies_provider.dart';
import '../../../features/time_window/domain/time_window.dart';
import 'movies_home_wrapper/movies_home_wrapper.dart';

class MoviesHomePage extends StatelessWidget {
  const MoviesHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        _AppBar(title: title),
        const SliverToBoxAdapter(
          child: LimitedBox(
            maxHeight: 300,
            child: MovieGenreTab(),
          ),
        ),
        const SliverToBoxAdapter(child: MoviesHomeWrapper()),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      title: Text(title),
      centerTitle: true,
      titleSpacing: 10,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        background: _TrendingMoviesCarousel(),
      ),
    );
  }
}

class _TrendingMoviesCarousel extends ConsumerWidget {
  const _TrendingMoviesCarousel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMovies = ref.watch(
      getTrendingMoviesProvider(TimeWindow.week),
    );

    final localization = AppLocalizations.of(context)!;

    return trendingMovies.when(
      data: (movies) {
        final movieList = movies.take(6).toList();

        if (movieList.isEmpty) {
          return Center(
            child: Text(localization.noTrendingMovies),
          );
        }

        return MovieCarousel(movies: movies.take(6).toList());
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getTrendingMoviesError);

        return Center(
          child: ErrorText(localization.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
