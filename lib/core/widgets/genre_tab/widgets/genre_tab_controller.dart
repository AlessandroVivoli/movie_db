import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/genre/domain/genre.dart';
import 'genre_tab_movies.dart';

class GenreTabController extends ConsumerWidget {
  const GenreTabController({
    super.key,
    required this.data,
    this.includeAdult = false,
  });

  final List<Genre> data;
  final bool includeAdult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: data.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: List<Tab>.generate(
              data.length,
              (index) {
                return Tab(
                  child: Text(
                    localization.translateGenres(
                      data[index].name.replaceAll(' ', ''),
                    ),
                  ),
                );
              },
            ),
          ),
          LimitedBox(
            maxHeight: 250,
            child: TabBarView(
              children: List<Widget>.generate(
                data.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GenreTabMovies(
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
