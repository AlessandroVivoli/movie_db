import 'package:flutter/material.dart';

import '../../../../core/services/genre_service.dart';
import '../../../../core/services/movie_service.dart';
import '../movie_list/movie_list.dart';

class GenreTab extends StatelessWidget {
  const GenreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GenreService.getGenres(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData == false) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [Text('Nothing found')],
            );
          }

          final data = snapshot.data!;

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
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: List<Widget>.generate(
                      data.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: MovieList(
                          movieList: MovieService.getPopularMovies(
                            withGenres: [data[index].id],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [CircularProgressIndicator()],
        );
      },
    );
  }
}
