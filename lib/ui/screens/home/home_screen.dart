import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../core/models/user/user.dart';
import '../../../core/providers/account_service_provider.dart';
import '../../../core/providers/local_storage_provider.dart';
import '../../../core/providers/movie_provider.dart';
import '../../../core/providers/user_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions.dart';
import '../../shared/widgets/account_drawer/account_drawer.dart';
import '../../shared/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../shared/widgets/errors/error_text.dart';
import '../../shared/widgets/genre_tab/genre_tab.dart';
import '../../shared/widgets/search_field/search_field.dart';
import 'home_wrapper/home_wrapper.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    final localStorage = ref.read(localStorageProvider);

    final sessionId = localStorage?.getSessionId();

    useEffect(() {
      if (sessionId != null) {
        getUser(ref, sessionId);
      }

      return null;
    }, [localStorage]);

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
    );
  }

  void getUser(WidgetRef ref, String sessionId) async {
    final accountDetails = await ref
        .read(accountServiceProvider)
        .getAccountDetails(sessionId: sessionId);

    ref.read(userProvider.notifier).state = User(
      accountDetails: accountDetails,
      sessionId: sessionId,
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
        Consumer(
          builder: (context, ref, child) {
            return SearchField(
              searchBuilder: (context, searchTerm) {
                return List<Widget>.empty();
              },
              onSubmit: (searchTerm) {
                // Add navigation to search results screen
              },
            );
          },
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

        context.showErrorSnackBar('Could not get trending movies.');

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
