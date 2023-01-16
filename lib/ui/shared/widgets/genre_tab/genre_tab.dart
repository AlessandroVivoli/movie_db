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
        late Widget widget;

        if (snapshot.connectionState == ConnectionState.waiting) {
          widget = const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
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

            widget = const Center(
              child: ErrorText('Something went wrong.'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            widget = const Center(
              child: Text('Nothing found.'),
            );
          } else {
            final data = snapshot.data!;

            widget = GenreTabController(data: data);
          }
        }

        return widget;
      },
    );
  }
}
