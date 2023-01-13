import 'package:flutter/material.dart';

import '../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../core/services/person_service.dart';
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
        Container(
          margin: const EdgeInsets.only(bottom: 20, left: 10),
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
          child: FutureBuilder(
            future: PersonService.getCast(movieId: details.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not get cast')),
                  );
                });

                return const Center(
                  child: Text('Nothing found'),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Nothing found'),
                );
              }

              return PersonList(
                personList: snapshot.data!,
                padding: 10,
              );
            },
          ),
        ),
      ],
    );
  }
}
