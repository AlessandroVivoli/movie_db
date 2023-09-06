import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/genre/provider/get_movie_genres_provider.dart';
import '../../features/movies/provider/get_top_rated_movies_provider.dart';
import '../../features/movies/provider/get_trending_movies_provider.dart';
import '../../features/person/provider/get_trending_persons_provider.dart';
import '../../features/tv_shows/provider/get_trending_tvs_provider.dart';
import '../account_drawer/account_drawer.dart';
import 'favorites_page/favorites_page.dart';
import 'movies_home_page/movies_home_page.dart';
import 'tv_home_page/tv_home_page.dart';
import 'watchlist_page/watchlist_page.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useValueNotifier(0);

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: AccountDrawer(
            onLogin: () => scaffoldKey.currentState?.closeDrawer(),
          ),
        ),
        bottomNavigationBar: _BottomNavigationBar(selectedIndex: selectedIndex),
        body: _RefreshIndicator(index: selectedIndex, title: title),
      ),
    );
  }
}

class _RefreshIndicator extends HookConsumerWidget {
  const _RefreshIndicator({
    required this.index,
    required this.title,
  });

  final ValueNotifier<int> index;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgets = <Widget>[
      MoviesHomePage(title: title),
      TVHomePage(title: title),
      WatchlistPage(title: title),
      FavoritesPage(title: title)
    ];

    final selectedIndex = useValueListenable(index);

    return RefreshIndicator(
      onRefresh: () {
        return Future(() {
          final index = selectedIndex;
          if (widgets[index] is MoviesHomePage) {
            ref.invalidate(getTrendingMoviesProvider);
            ref.invalidate(getTopRatedMoviesProvider);
            ref.invalidate(getMovieGenresProvider);
          } else if (widgets[index] is TVHomePage) {
            ref.invalidate(getTrendingTVShowsProvider);
          } else if (widgets[index] is FavoritesPage) {
          } else if (widgets[index] is WatchlistPage) {}

          final isMoviesOrTV =
              widgets[index] is MoviesHomePage || widgets[index] is TVHomePage;

          if (isMoviesOrTV) {
            ref.invalidate(getTrendingPersonsProvider);
          }
        });
      },
      child: widgets[selectedIndex],
    );
  }
}

class _BottomNavigationBar extends HookConsumerWidget {
  final ValueNotifier<int> selectedIndex;

  const _BottomNavigationBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user);

    final index = useValueListenable(selectedIndex);

    return BottomNavigationBar(
      enableFeedback: true,
      elevation: 10,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          activeIcon: const Icon(Icons.movie),
          icon: const Icon(Icons.movie_outlined),
          label: context.locale.bottomBarMoviesLabel,
        ),
        BottomNavigationBarItem(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          icon: const Icon(Icons.tv),
          label: context.locale.bottomBarTVShowsLabel,
        ),
        if (user != null)
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            activeIcon: const Icon(Icons.bookmark),
            icon: const Icon(Icons.bookmark_outline),
            label: context.locale.bottomBarWatchlistLabel,
          ),
        if (user != null)
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            activeIcon: const Icon(Icons.favorite),
            icon: const Icon(Icons.favorite_border_outlined),
            label: context.locale.bottomBarFavoritesLabel,
          ),
      ],
      onTap: (index) => selectedIndex.value = index,
    );
  }
}
