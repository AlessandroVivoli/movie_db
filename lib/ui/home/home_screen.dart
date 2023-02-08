import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/routes.dart';
import '../../core/widgets/account_drawer/account_drawer.dart';
import '../../core/widgets/search/custom_search_delegate.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/genre/provider/get_movie_genres_provider.dart';
import '../../features/movies/provider/get_top_rated_movies_provider.dart';
import '../../features/movies/provider/get_trending_movies_provider.dart';
import '../../features/person/provider/get_trending_persons_provider.dart';
import 'favorites_page/favorites_page.dart';
import 'movies_home_page/movies_home_page.dart';
import 'tv_home_page/tv_home_page.dart';
import 'watchlist_page/watchlist_page.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).whenOrNull(loggedIn: (user) => user);

    final selectedIndex = useState(0);

    final widgets = <Widget>[
      MoviesHomePage(title: title),
      TVHomePage(title: title),
      WatchlistPage(title: title),
      FavoritesPage(title: title)
    ];

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
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          elevation: 10,
          currentIndex: selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              activeIcon: const Icon(Icons.movie),
              icon: const Icon(Icons.movie_outlined),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(Icons.tv),
              label: 'TV Shows',
            ),
            if (user != null)
              BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                activeIcon: const Icon(Icons.bookmark),
                icon: const Icon(Icons.bookmark_outline),
                label: 'Watchlist',
              ),
            if (user != null)
              BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                activeIcon: const Icon(Icons.favorite),
                icon: const Icon(Icons.favorite_border_outlined),
                label: 'Favorites',
              ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(Icons.search),
              label: 'Search',
            ),
          ],
          onTap: (index) async {
            if ((index == 2 && user == null) || (index == 4 && user != null)) {
              final movieId = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              if (movieId != null) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.pushNamed(
                    context,
                    AppRoute.movie,
                    arguments: movieId,
                  );
                });
              }

              return;
            }

            selectedIndex.value = index;
          },
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future(() {
              final index = selectedIndex.value;
              if (widgets[index] is MoviesHomePage) {
                ref.invalidate(getTrendingMoviesProvider);
                ref.invalidate(getTopRatedMoviesProvider);
                ref.invalidate(getMovieGenresProvider);
              } else if (widgets[index] is TVHomePage) {
              } else if (widgets[index] is FavoritesPage) {
              } else if (widgets[index] is WatchlistPage) {}

              final isMoviesOrTV = widgets[index] is MoviesHomePage ||
                  widgets[index] is TVHomePage;

              if (isMoviesOrTV) {
                ref.invalidate(getTrendingPersonsProvider);
              }
            });
          },
          child: widgets[selectedIndex.value],
        ),
      ),
    );
  }
}
