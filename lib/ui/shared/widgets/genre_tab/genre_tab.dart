import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not get genres')),
            );
          });

          return const Center(child: Text('Nothing found'));
        }

        if (!snapshot.hasData || (snapshot.hasData && snapshot.data!.isEmpty)) {
          return const Center(child: Text('Nothing found'));
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
              LimitedBox(
                maxHeight: 250,
                child: TabBarView(
                  children: List<Widget>.generate(
                    data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FutureBuilder(
                        future: MovieService.getMovies(
                          withGenres: [data[index].id],
                          sortBy: 'popularity.desc',
                        ),
                        builder: _buildMovieList,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMovieList(
    BuildContext context,
    AsyncSnapshot<List<Movie>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not get movies')),
        );
      });

      return const Center(
        child: Text('Nothing found!'),
      );
    }

    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(
        child: Text('Nothing found!'),
      );
    }

    return MovieList(
      movieList: snapshot.data!,
      padding: 10,
    );
  }
}
