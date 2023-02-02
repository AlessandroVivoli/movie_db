import 'package:flutter/material.dart';

import '../../../../../features/genre/domain/genre.dart';
import 'genre_tab_movies.dart';

class GenreTabController extends StatelessWidget {
  const GenreTabController({
    super.key,
    required this.data,
    this.includeAdult,
  });

  final List<Genre> data;
  final bool? includeAdult;

  @override
  Widget build(BuildContext context) {
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
                  child: Text(data[index].name),
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
