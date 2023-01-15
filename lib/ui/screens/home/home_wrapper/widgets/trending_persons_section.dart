import 'package:flutter/material.dart';

import '../../../../../core/services/person_service.dart';
import '../../../../shared/widgets/person_list/person_list.dart';

class TrendingPersonsSection extends StatelessWidget {
  const TrendingPersonsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TrendingPersonsText(),
        _TrendingPersonsList(),
      ],
    );
  }
}

class _TrendingPersonsText extends StatelessWidget {
  const _TrendingPersonsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            'Trending persons on this week'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendingPersonsList extends StatelessWidget {
  const _TrendingPersonsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 130,
        child: FutureBuilder(
          future: PersonService.getTrendingPersons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Could not get trending persons'),
                  ),
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

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: PersonList(personList: snapshot.data!),
            );
          },
        ),
      ),
    );
  }
}
