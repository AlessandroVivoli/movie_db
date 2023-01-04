import 'package:flutter/material.dart';

import '../../../core/models/movie/movie.dart';
import '../../../core/services/movie_service.dart';
import '../../shared/widgets/genre_tab/genre_tab.dart';
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
                future: MovieService.getPopularMovies(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text('Nothing found.'),
                      );
                    }

                    return Carousel(
                      movies: (snapshot.data as List<Movie>).take(6).toList(),
                    );
                  }

                  return const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
              ),
              const GenreTab()
            ],
          ),
        ),
      ),
    );
  }
}
