import 'package:flutter/material.dart';

class TVHomePage extends StatelessWidget {
  const TVHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _AppBar(title: title),
        const SliverFillRemaining(
          child: Placeholder(),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      title: Text(title),
      centerTitle: true,
      flexibleSpace: const FlexibleSpaceBar(),
    );
  }
}
