import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../movie_card/movie_card.dart';

class MovieList extends StatelessWidget {
  final Future<List<Movie>?>? movieList;

  const MovieList({super.key, this.movieList});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData == false) {
            return const Center(
              child: Text('Nothing found.'),
            );
          }

          final data = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(
              data.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MovieCard(
                    movie: data[index],
                  ),
                );
              },
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
