import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/routes.dart';
import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/account_drawer/account_drawer.dart';
import '../../core/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../core/widgets/genre_tab/genre_tab.dart';
import '../../core/widgets/search/custom_search_delegate.dart';
import '../../features/genre/provider/get_genres_provider.dart';
import '../../features/movies/provider/get_top_rated_movies_provider.dart';
import '../../features/movies/provider/get_trending_movies_provider.dart';
import '../../features/person/provider/get_trending_persons_provider.dart';
import '../../features/time_window/domain/time_window.dart';
import 'home_wrapper/home_wrapper.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: AccountDrawer(
            onLogin: () async {
              if (scaffoldKey.currentState != null) {
                scaffoldKey.currentState!.closeDrawer();
              }
            },
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future(() {
              ref.invalidate(getTrendingMoviesProvider);
              ref.invalidate(getGenresProvider);
              ref.invalidate(getTrendingPersonsProvider);
              ref.invalidate(getTopRatedMoviesProvider);
            });
          },
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              _AppBar(title: title),
              const SliverToBoxAdapter(
                child: LimitedBox(
                  maxHeight: 300,
                  child: GenreTab(),
                ),
              ),
              const SliverToBoxAdapter(child: HomeWrapper()),
            ],
          ),
        ),
      ),
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
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            ).then(
              (movieId) => (movieId != null)
                  ? Navigator.pushNamed(
                      context,
                      AppRoute.movie,
                      arguments: movieId,
                    )
                  : null,
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        background: _TrendingMoviesBuilder(),
      ),
    );
  }
}

class _TrendingMoviesBuilder extends ConsumerWidget {
  const _TrendingMoviesBuilder();

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
