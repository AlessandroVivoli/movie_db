import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/widgets/carousel/tv_carousel/tv_carousel.dart';
import '../../../core/widgets/errors/error_text.dart';
import '../../../core/widgets/genre_tab/tv_genre_tab.dart';
import '../../../core/widgets/search/tv_show_search_delegate.dart';
import '../../../features/time_window/domain/time_window.dart';
import '../../../features/tv_shows/provider/get_trending_tvs_provider.dart';
import '../../../routing/routes.dart';
import 'tvs_home_wrapper/tvs_home_wrapper.dart';

class TVHomePage extends StatelessWidget {
  const TVHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _AppBar(title: title),
        const SliverToBoxAdapter(
          child: TVGenreTab(),
        ),
        const SliverToBoxAdapter(
          child: TVsHomeWrapper(),
        ),
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
      pinned: true,
      expandedHeight: 200,
      actions: [
        IconButton(
          onPressed: () async {
            final tvId = await showSearch(
              context: context,
              delegate: TVShowSearchDelegate(),
            );

            if (tvId != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamed(context, AppRoute.tv, arguments: tvId);
              });
            }
          },
          icon: const Icon(Icons.search),
        )
      ],
      title: Text(title),
      centerTitle: true,
      flexibleSpace: const FlexibleSpaceBar(
        background: _TrendingTVsCarousel(),
      ),
    );
  }
}

class _TrendingTVsCarousel extends ConsumerWidget {
  const _TrendingTVsCarousel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingTvs = ref.watch(getTrendingTVShowsProvider(TimeWindow.week));

    return trendingTvs.when(
      data: (tvs) {
        final tvList = tvs.take(6).toList();

        if (tvList.isEmpty) {
          return Center(
            child: Text(context.locale.noTrendingTVShows),
          );
        }

        return TVCarousel(tvs: tvList);
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.trendingTVShowsError);

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
