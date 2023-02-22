import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../paginator/paginator.dart';
import 'widgets/favorite_movies_tab.dart';
import 'widgets/favorite_tv_shows_tab.dart';

class FavoritesPageBody extends HookWidget {
  const FavoritesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final page = useValueNotifier(1);
    final maxPage = useValueNotifier(0);

    final controller = useTabController(initialLength: 2);

    useEffect(() {
      f() {
        page.value = 1;
      }

      controller.addListener(f);
      return () => controller.removeListener(f);
    }, []);

    return Column(
      children: [
        TabBar(
          controller: controller,
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
            children: [
              FavoriteMoviesTab(page: page, maxPage: maxPage),
              FavoriteTVShowsTab(page: page, maxPage: maxPage)
            ],
          ),
        ),
        Paginator(
          page: page,
          maxPage: maxPage,
        )
      ],
    );
  }
}
