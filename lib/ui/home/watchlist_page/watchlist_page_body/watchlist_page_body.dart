import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import 'widgets/movie_watchlist_tab.dart';
import 'widgets/tv_show_watchlist_tab.dart';

class WatchlistPageBody extends HookWidget {
  const WatchlistPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);

    return Column(
      children: [
        TabBar(
          controller: controller,
          indicator: ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2.5,
              ),
            ),
          ),
          indicatorPadding: const EdgeInsets.only(bottom: 2.5),
          tabs: [
            Tab(
              icon: const Icon(Icons.movie),
              text: context.locale.bottomBarMoviesLabel,
            ),
            Tab(
              icon: const Icon(Icons.tv),
              text: context.locale.bottomBarTVShowsLabel,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: const [
              MovieWatchlistTab(),
              TVShowWatchlistTab(),
            ],
          ),
        ),
      ],
    );
  }
}
