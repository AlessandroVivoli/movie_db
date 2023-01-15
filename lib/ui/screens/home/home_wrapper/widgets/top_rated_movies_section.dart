import 'package:flutter/material.dart';

import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopRatedMoviesText(),
        _TopRatedMoviesList(),
      ],
    );
  }
}

class _TopRatedMoviesText extends StatelessWidget {
  const _TopRatedMoviesText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            'Top rated movies'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopRatedMoviesList extends StatelessWidget {
  const _TopRatedMoviesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 250,
      child: FutureBuilder(
        future: MovieService.getTopRatedMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Could not get top rated movies'),
                ),
              );
            });

            return const Center(
              child: Text('Has error'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nothing found'),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MovieList(movieList: snapshot.data!),
          );
        },
      ),
    );
  }
}
