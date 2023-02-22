import 'package:flutter/material.dart';

import 'watchlist_page_body/watchlist_page_body.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        const Expanded(
          child: WatchlistPageBody(),
        ),
      ],
    );
  }
}
