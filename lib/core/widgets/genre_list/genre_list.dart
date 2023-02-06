import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/genre/domain/genre.dart';
import '../../../features/localization/provider/locale_state_provider.dart';
import '../../extensions/list_extensions.dart';

class GenreList extends ConsumerWidget {
  final List<Genre> genres;

  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeStateProvider);

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
              genres[index].getName(locale),
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
