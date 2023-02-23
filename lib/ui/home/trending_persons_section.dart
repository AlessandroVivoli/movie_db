import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/error_text/error_text.dart';
import '../../core/widgets/person_list/person_list.dart';
import '../../features/person/domain/profile_sizes_enum.dart';
import '../../features/person/provider/get_trending_persons_provider.dart';
import '../../features/person/provider/image/person_image_service_provider.dart';
import '../../features/time_window/domain/time_window.dart';

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
            context.locale.trendingPersonsSectionTitle.toUpperCase(),
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

    final imageService = ref.watch(personImageServiceProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 130,
        child: trendingPresons.when(
          data: (persons) {
            if (persons.isEmpty) {
              return Center(
                child: Text(context.locale.noTrendingPersons),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: PersonList(
                length: persons.length,
                nameBuilder: (index) => persons[index].name,
                imageBuilder: (index) => imageService.getPersonProfileUrl(
                  size: ProfileSizes.w185,
                  path: persons[index].profilePath,
                ),
                departmentBuilder: (index) => persons[index].knownForDepartment,
              ),
            );
          },
          error: (error, stackTrace) {
            context.showErrorSnackBar(context.locale.getTrendingPersonsError);

            return Center(
              child: ErrorText(context.locale.unexpectedErrorMessage),
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
