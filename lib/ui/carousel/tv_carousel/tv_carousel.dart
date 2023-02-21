import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../features/tv_shows/domain/tv_show.dart';
import '../shared/carousel_active_dot.dart';
import 'tv_carousel_item.dart';

class TVCarousel extends HookWidget {
  final List<TVShow> tvs;
  final double? height;

  const TVCarousel({super.key, required this.tvs, this.height});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final page = useState(0);

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              controller.animateToPage(
                (page.value == 0) ? tvs.length - 1 : 0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.linear,
              );

              return true;
            },
            child: PageView.builder(
              onPageChanged: (index) => page.value = index,
              allowImplicitScrolling: true,
              controller: controller,
              itemCount: tvs.length,
              pageSnapping: true,
              itemBuilder: (context, index) => TVCraouselItem(
                image: tvs[index].backdropPath,
                title: tvs[index].name,
                id: tvs[index].id,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                tvs.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                    ),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CarouselActiveDot(
            controller: controller,
            length: tvs.length,
            radius: 3,
            padding: 5,
          ),
        ],
      ),
    );
  }
}
