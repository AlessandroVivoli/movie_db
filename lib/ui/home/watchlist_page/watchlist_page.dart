import 'package:flutter/material.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          title: Text(title),
          centerTitle: true,
          flexibleSpace: const FlexibleSpaceBar(),
        ),
        const SliverFillRemaining(
          child: Placeholder(),
        )
      ],
    );
  }
}
