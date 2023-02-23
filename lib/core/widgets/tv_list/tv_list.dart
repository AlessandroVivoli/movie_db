import 'package:flutter/material.dart';

import '../tv_card/tv_card.dart';

class TVList extends StatelessWidget {
  final double padding;
  final ScrollController? controller;
  final double seperatorSize;

  final int length;

  final String? Function(int index) imageBuilder;
  final void Function(int index)? onCardTap;
  final bool Function(int index) isAdultBuilder;
  final String Function(int index) nameBuilder;
  final double Function(int index) averageVoteBuilder;

  const TVList({
    super.key,
    this.padding = 0,
    this.controller,
    this.seperatorSize = 10,
    required this.imageBuilder,
    this.onCardTap,
    required this.length,
    required this.isAdultBuilder,
    required this.nameBuilder,
    required this.averageVoteBuilder,
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
          child: TVCard(
            imageUrl: imageBuilder(index),
            adult: isAdultBuilder(index),
            name: nameBuilder(index),
            voteAverage: averageVoteBuilder(index),
            onTap: () => onCardTap != null ? onCardTap!(index) : null,
          ),
        );
      },
    );
  }
}
