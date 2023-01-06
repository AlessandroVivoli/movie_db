import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../core/services/movie_service.dart';
import '../../../core/services/person_service.dart';
import '../../shared/widgets/genre_tab/genre_tab.dart';
import '../../shared/widgets/movie_list/movie_list.dart';
import '../../shared/widgets/person_list/person_list.dart';
import 'carousel/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: MovieService.getTrendingMovies(timeWindow: 'week'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not get trending movies'),
                        ),
                      );
                    });

                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text('Nothing found.'),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text('Nothing found.'),
                      ),
                    );
                  }

                  return Carousel(
                    movies: (snapshot.data!).take(6).toList(),
                  );
                },
              ),
              const LimitedBox(
                maxHeight: 300,
                child: GenreTab(),
              ),
              const _Wrapper(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Wrapper extends StatelessWidget {
  const _Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  'Trending persons on this week'.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: FutureBuilder(
              future: PersonService.getTrendingPersons(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not get trending persons'),
                      ),
                    );
                  });
                  return const Center(
                    child: Text('Nothing found'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Nothing found'),
                  );
                }

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: PersonList(personList: snapshot.data!),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
          ),
          LimitedBox(
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
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
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

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: MovieList(movieList: snapshot.data!),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
