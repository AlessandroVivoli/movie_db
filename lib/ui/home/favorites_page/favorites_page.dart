import 'package:flutter/material.dart';

import 'favorites_page_body/favorites_page_body.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text(title),
          centerTitle: true,
          flexibleSpace: const FlexibleSpaceBar(),
        ),
        const SliverFillRemaining(
          child: FavoritesPageBody(),
        )
      ],
    );
  }
}
