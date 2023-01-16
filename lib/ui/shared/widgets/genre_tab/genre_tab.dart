import 'package:flutter/material.dart';

import '../../../../core/services/genre_service.dart';
import '../errors/error_snack_bar_content.dart';
import '../errors/error_text.dart';
import 'widgets/genre_tab_controller.dart';

class GenreTab extends StatelessWidget {
  const GenreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GenreService.getGenres(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nothing found.'),
            );
          }

          final data = snapshot.data!;

          return GenreTabController(data: data);
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const ErrorSnackBarContent(
                  message: 'Could not get genres.',
                ),
              ),
            );
          });

          return const Center(
            child: ErrorText('Something went wrong.'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
