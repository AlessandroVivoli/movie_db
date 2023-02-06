import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/genre/domain/genre.dart';
import '../../extensions/list_extensions.dart';

class GenreList extends ConsumerWidget {
  final List<Genre> genres;

  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

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
              localization.translateGenres(
                genres[index].name.replaceAll(' ', ''),
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
