import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../extensions/list_extensions.dart';

class GenreList extends StatelessWidget {
  final List<String> genres;

  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          genres.length,
          (index) => Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.fromBorderSide(
                BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            child: Text(
              context.locale.translateGenres(
                genres[index]
                    .replaceAll(' ', '')
                    .replaceAll('&', 'And')
                    .replaceAll('-', ''),
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ).joinElement(
          const SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
