import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../movie_list/movie_list.dart';

class PagedMovieList extends HookWidget {
  const PagedMovieList({
    super.key,
    this.onCardTap,
    this.onPageChanged,
    required this.imageBuilder,
    required this.averageVoteBuilder,
    required this.length,
    required this.isAdultBuilder,
    required this.titleBuilder,
    required this.page,
    required this.totalPages,
  });

  final void Function(int movieId)? onCardTap;
  final void Function(int page)? onPageChanged;
  final String? Function(int index) imageBuilder;
  final double Function(int index) averageVoteBuilder;
  final bool Function(int index) isAdultBuilder;
  final String Function(int index) titleBuilder;
  final int length;

  final int page;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Column(
      children: [
        Expanded(
          child: MovieList(
            length: length,
            controller: scrollController,
            imageBuilder: imageBuilder,
            onCardTap: onCardTap,
            averageVoteBuilder: averageVoteBuilder,
            isAdultBuilder: isAdultBuilder,
            titleBuilder: titleBuilder,
          ),
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (onPageChanged == null || page == 1)
                    ? null
                    : () {
                        onPageChanged!(page - 1);

                        scrollController.jumpTo(0);
                      },
                icon: const Icon(Icons.chevron_left),
              ),
              Text('$page'),
              IconButton(
                onPressed: (onPageChanged == null || page >= totalPages)
                    ? null
                    : () {
                        onPageChanged!(page + 1);

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
