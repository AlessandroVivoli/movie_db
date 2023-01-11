import 'package:flutter/material.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../../core/services/movie_service.dart';
import '../../../../core/services/person_service.dart';
import '../../../../core/services/video_service.dart';
import '../../shared/widgets/backdrop_image/backdrop_image.dart';
import '../../shared/widgets/genre_list/genre_list.dart';
import '../../shared/widgets/movie_list/movie_list.dart';
import '../../shared/widgets/person_list/person_list.dart';
import '../../shared/widgets/rating/rating.dart';
import 'floating_button/floating_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final movieDetails = args as Future<MovieDetails>?;

    return SafeArea(
      child: FutureBuilder(
        future: movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Could not get movie details')),
              );
            });

            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text('Nothing found'),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text('Nothing found'),
              ),
            );
          }

          final data = snapshot.data!;

          return Scaffold(
            body: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 250,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          data.originalTitle ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        centerTitle: true,
                        background: (data.backdropPath != null)
                            ? BackdropImage(imgUrl: data.backdropPath!)
                            : null,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _Wrapper(details: data),
                    )
                  ],
                ),
                FloatingButton(
                  controller: _scrollController,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/play',
                    arguments: VideoService.getVideos(movieId: data.id!),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Wrapper extends StatelessWidget {
  final MovieDetails details;

  const _Wrapper({required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Rating(
                rating: details.voteAverage!,
                alignment: MainAxisAlignment.start,
                padding: 1.3,
                size: 14,
                digits: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Overview'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Text('${details.overview}'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Budget'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${details.budget} \$',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duration'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${details.runtime} min',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Release date'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${details.releaseDate}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Genres'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GenreList(genres: details.genres!),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Casts'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: FutureBuilder(
            future: PersonService.getCast(movieId: details.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not get cast')),
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

              return PersonList(
                personList: snapshot.data!,
                padding: 10,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Similar movies'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w500,
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
