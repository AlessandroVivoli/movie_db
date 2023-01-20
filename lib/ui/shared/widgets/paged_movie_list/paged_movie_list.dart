import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie_list.dart';
import '../movie_list/movie_list.dart';

class PagedMovieList extends StatefulWidget {
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
  State<PagedMovieList> createState() => _PagedMovieListState();
}

class _PagedMovieListState extends State<PagedMovieList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MovieList(
            movieList: widget.movieList.results,
            controller: _scrollController,
            onReturn: widget.onReturn,
            refreshOnReturn: widget.refreshOnReturn,
          ),
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed:
                    (widget.onPageChanged == null || widget.movieList.page == 1)
                        ? null
                        : () {
                            onPageChanged(widget.movieList.page - 1);
                          },
                icon: const Icon(Icons.chevron_left),
              ),
              Text('${widget.movieList.page}'),
              IconButton(
                onPressed: (widget.onPageChanged == null ||
                        widget.movieList.page >= widget.movieList.totalPages)
                    ? null
                    : () {
                        onPageChanged(widget.movieList.page + 1);
                      },
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ],
    );
  }

  onPageChanged(int page) async {
    widget.onPageChanged!(page);

    _scrollController.jumpTo(0);
  }
}
