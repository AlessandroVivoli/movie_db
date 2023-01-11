import 'package:flutter/material.dart';

import '../../../../../core/services/movie_service.dart';
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Could not get movie credits')),
              );
            });

            return const Center(child: Text('Nothing found'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nothing found'));
          }

          return MovieList(movieList: snapshot.data!);
        },
      ),
    );
  }
}
