import 'package:flutter/material.dart';

import '../../../../../core/models/genre/genre.dart';
import 'genre_tab_builder.dart';

class GenreTabController extends StatelessWidget {
  const GenreTabController({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Genre> data;

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
                  child: GenreTabBuilder(genreId: data[index].id),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
