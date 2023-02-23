import 'package:flutter/material.dart';

import '../movie_card/movie_card.dart';

class MovieList extends StatelessWidget {
  final double padding;
  final ScrollController? controller;
  final double seperatorSize;
  final String? Function(int index) imageBuilder;
  final void Function(int index)? onCardTap;

  final bool Function(int index) isAdultBuilder;
  final String Function(int index) titleBuilder;
  final double Function(int index) averageVoteBuilder;

  final int length;

  const MovieList({
    super.key,
    this.padding = 0,
    this.seperatorSize = 10,
    this.controller,
    required this.imageBuilder,
    this.onCardTap,
    required this.isAdultBuilder,
    required this.titleBuilder,
    required this.averageVoteBuilder,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: length,
      padding: EdgeInsets.symmetric(horizontal: padding),
      separatorBuilder: (context, index) {
        return SizedBox(width: seperatorSize);
      },
      itemBuilder: (context, index) {
        return LimitedBox(
          maxWidth: 117,
          child: MovieCard(
            imageUrl: imageBuilder(index),
            onTap: () => onCardTap != null ? onCardTap!(index) : null,
            adult: isAdultBuilder(index),
            title: titleBuilder(index),
            voteAverage: averageVoteBuilder(index),
          ),
        );
      },
    );
  }
}
