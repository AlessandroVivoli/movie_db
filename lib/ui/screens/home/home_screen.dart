import 'package:flutter/material.dart';

import '../../../core/services/movie_service.dart';
import '../../shared/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
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
            children: const [
              _TrendingMoviesBuilder(),
              LimitedBox(
                maxHeight: 300,
                child: GenreTab(),
              ),
              HomeWrapper(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendingMoviesBuilder extends StatelessWidget {
  const _TrendingMoviesBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieService.getTrendingMovies(timeWindow: 'week'),
      builder: (context, snapshot) {
        late Widget widget;

        if (snapshot.connectionState == ConnectionState.waiting) {
          widget = const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  content: const ErrorSnackBarContent(
                    message: 'Could not get trending movies.',
                  ),
                ),
              );
            });

            widget = const SizedBox(
              height: 200,
              child: Center(
                child: ErrorText('Something went wrong.'),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            widget = const SizedBox(
              height: 200,
              child: Center(
                child: Text('Nothing found.'),
              ),
            );
          } else {
            widget = MovieCarousel(
              height: 200,
              movies: (snapshot.data!).take(6).toList(),
            );
          }
        }

        return widget;
      },
    );
  }
}
