import 'package:flutter/material.dart';

import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class PersonCredits extends StatelessWidget {
  const PersonCredits({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credits'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        _CreditsList(id: id)
      ],
    );
  }
}

class _CreditsList extends StatelessWidget {
  const _CreditsList({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FutureBuilder(
        future: MovieService.getPersonCredits(personId: id),
        builder: (context, snapshot) {
          late Widget widget;

          if (snapshot.connectionState == ConnectionState.waiting) {
            widget = const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    content: const ErrorSnackBarContent(
                      message: 'Could not get movie credits.',
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
            } else if (snapshot.hasData) {
              widget = MovieList(movieList: snapshot.data!);
            }
          }

          return widget;
        },
      ),
    );
  }
}
