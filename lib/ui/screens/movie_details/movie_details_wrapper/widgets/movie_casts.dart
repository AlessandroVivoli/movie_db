import 'package:flutter/material.dart';

import '../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../core/services/person_service.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/person_list/person_list.dart';

class MovieCasts extends StatelessWidget {
  const MovieCasts({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 10),
          child: Text(
            'Casts'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: _CastBuilder(details: details),
        ),
      ],
    );
  }
}

class _CastBuilder extends StatelessWidget {
  const _CastBuilder({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PersonService.getCast(movieId: details.id!),
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
                    message: 'Could not get cast.',
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
            widget = PersonList(
              personList: snapshot.data!,
              padding: 10,
            );
          }
        }

        return widget;
      },
    );
  }
}