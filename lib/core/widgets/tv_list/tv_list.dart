import 'package:flutter/material.dart';

import '../../../features/tv_shows/domain/tv_show.dart';
import '../tv_card/tv_card.dart';

class TVList extends StatelessWidget {
  final List<TVShow> tvList;
  final double padding;
  final ScrollController? controller;
  final double seperatorSize;

  final String? Function(String? imagePath) imageBuilder;

  const TVList({
    super.key,
    required this.tvList,
    this.padding = 0,
    this.controller,
    this.seperatorSize = 10,
    required this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: tvList.length,
      padding: EdgeInsets.symmetric(horizontal: padding),
      separatorBuilder: (context, index) {
        return SizedBox(width: seperatorSize);
      },
      itemBuilder: (context, index) {
        return TVCard(
          tvShow: tvList[index],
          imageUrl: imageBuilder(
            tvList[index].posterPath,
          ),
        );
      },
    );
  }
}
