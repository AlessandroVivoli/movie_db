import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../core/providers/general_providers.dart';
import '../../../core/providers/service_providers.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/constants.dart';
import '../../shared/widgets/account_drawer/account_drawer.dart';
import '../../shared/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import '../../shared/widgets/genre_tab/genre_tab.dart';
import 'home_wrapper/home_wrapper.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountService = ref.watch(accountServiceProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    String? sessionId = SessionProvider.sessionId;

    useEffect(() {
      if (sessionId != null) {
        accountService.getAccountDetails(sessionId: sessionId).then(
              (value) => ref
                  .read(
                    accountDetailsStateProvider.notifier,
                  )
                  .state = value,
            );
      }

      return null;
    }, []);

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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              title: Text(title),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: _TrendingMoviesBuilder(),
              ),
            ),
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
    );
  }
}

final movieFutureProvider = FutureProvider.autoDispose(
  (ref) => ref
      .watch(movieServiceProvider)
      .getTrendingMovies(timeWindow: TimeWindow.week),
);

class _TrendingMoviesBuilder extends ConsumerWidget {
  const _TrendingMoviesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMovies = ref.watch(movieFutureProvider);

    return trendingMovies.when(
      data: (movies) {
        final movieList = movies.take(6).toList();

        if (movieList.isEmpty) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return MovieCarousel(movies: movies.take(6).toList());
      },
      error: (error, stackTrace) {
        logError('Could not get trending movies.', error, stackTrace);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: const ErrorSnackBarContent(
                message: 'Could not get trending movies.',
              ),
            ),
          );
        });

        return const Center(
          child: ErrorText('Something went wrong.'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
