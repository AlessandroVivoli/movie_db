import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/person/provider/person_provider.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/shared/widgets/errors/error_text.dart';
import '../../../../../core/shared/widgets/person_list/person_list.dart';

class TrendingPersonsSection extends StatelessWidget {
  const TrendingPersonsSection({
    super.key,
  });

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
  const _TrendingPersonsText();

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

class _TrendingPersonsList extends ConsumerWidget {
  const _TrendingPersonsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingPresons = ref.watch(
      getTrendingPersonsProvider(TimeWindow.week),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 130,
        child: trendingPresons.when(
          data: (persons) {
            if (persons.isEmpty) {
              return const Center(
                child: Text('Nothing found.'),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: PersonList(personList: persons),
            );
          },
          error: (error, stackTrace) {
            context.showErrorSnackBar('Could not get trending persons.');

            return const Center(
              child: ErrorText('Something went wrong.'),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
