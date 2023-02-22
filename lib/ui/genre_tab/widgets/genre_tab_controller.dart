import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../../../features/genre/domain/genre.dart';
import 'genre_tab_movies.dart';
import 'genre_tab_tvs.dart';

class GenreTabController extends ConsumerWidget {
  const GenreTabController({
    super.key,
    required this.data,
    this.includeAdult = false,
    required this.mediaType,
  });

  final List<Genre> data;
  final bool includeAdult;
  final String mediaType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: data.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            tabs: List<Tab>.generate(
              data.length,
              (index) {
                return Tab(
                  child: Text(
                    context.locale.translateGenres(
                      data[index]
                          .name
                          .replaceAll(' ', '')
                          .replaceAll('&', 'And')
                          .replaceAll('-', ''),
                    ),
                  ),
                );
              },
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 250),
            child: TabBarView(
              children: List.generate(
                data.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: (mediaType == 'movie')
                      ? GenreTabMovies(
                          genreId: data[index].id,
                          includeAdult: includeAdult,
                        )
                      : GenreTabTvs(
                          genreId: data[index].id,
                          includeAdult: includeAdult,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
