import 'package:flutter/material.dart';

import '../../../core/services/movie_service.dart';
import '../../shared/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../shared/widgets/genre_tab/genre_tab.dart';
import 'home_wrapper/home_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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

                  return MovieCarousel(
                    movies: (snapshot.data!).take(6).toList(),
                  );
                },
              ),
              const LimitedBox(
                maxHeight: 300,
                child: GenreTab(),
              ),
              const HomeWrapper(),
            ],
          ),
        ),
      ),
    );
  }
}
