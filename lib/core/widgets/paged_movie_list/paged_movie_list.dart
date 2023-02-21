import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../features/movies/domain/movie_list.dart';
import '../movie_list/movie_list.dart';

class PagedMovieList extends HookWidget {
  const PagedMovieList({
    super.key,
    this.onCardTap,
    this.onPageChanged,
    required this.movieList,
    required this.imageBuilder,
  });

  final MovieListModel movieList;
  final void Function(int movieId)? onCardTap;
  final void Function(int page)? onPageChanged;
  final String? Function(String? imagePath) imageBuilder;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Column(
      children: [
        Expanded(
          child: MovieList(
            movieList: movieList.results,
            controller: scrollController,
            imageBuilder: imageBuilder,
            onCardTap: onCardTap,
          ),
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (onPageChanged == null || movieList.page == 1)
                    ? null
                    : () {
                        onPageChanged!(movieList.page - 1);

                        scrollController.jumpTo(0);
                      },
                icon: const Icon(Icons.chevron_left),
              ),
              Text('${movieList.page}'),
              IconButton(
                onPressed: (onPageChanged == null ||
                        movieList.page >= movieList.totalPages)
                    ? null
                    : () {
                        onPageChanged!(movieList.page + 1);

                        scrollController.jumpTo(0);
                      },
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
