import 'package:flutter/material.dart';

import '../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class SimilarMovieList extends StatelessWidget {
  const SimilarMovieList({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Similar movies'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FutureBuilder(
              future: MovieService.getSimilarMovies(id: details.id!),
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
                          content: Text('Could not get similar movies')),
                    );
                  });

                  return const Center(
                    child: Text('Nothing found'),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Nothing found'),
                  );
                }

                return MovieList(
                  movieList: snapshot.data!,
                  padding: 10,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
