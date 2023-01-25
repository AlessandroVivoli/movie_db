import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/models/movie/movie_list.dart';
import '../movie_list/movie_list.dart';

class PagedMovieList extends HookWidget {
  const PagedMovieList({
    super.key,
    required this.movieList,
    this.onPageChanged,
    this.onReturn,
    this.refreshOnReturn,
  });

  final MovieListModel movieList;
  final void Function(int page)? onPageChanged;
  final void Function()? onReturn;
  final bool? refreshOnReturn;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Column(
      children: [
        Expanded(
          child: MovieList(
            movieList: movieList.results,
            controller: scrollController,
            onReturn: onReturn,
            refreshOnReturn: refreshOnReturn,
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
