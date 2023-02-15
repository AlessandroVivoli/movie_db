import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/errors/error_text.dart';
import '../../../../../core/widgets/tv_list/tv_list.dart';
import '../../../../../features/tv_shows/provider/get_top_rated_tv_shows_provider.dart';

class TopRatedTVsSection extends StatelessWidget {
  const TopRatedTVsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopRatedTVsText(),
        _TopRatedTVsList(),
      ],
    );
  }
}

class _TopRatedTVsText extends StatelessWidget {
  const _TopRatedTVsText();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        localization.topRatedTvsSectionTitle.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TopRatedTVsList extends ConsumerWidget {
  const _TopRatedTVsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topRatedTVs = ref.watch(getTopRatedTVShowsProvider);

    final localization = AppLocalizations.of(context)!;

    return LimitedBox(
      maxHeight: 250,
      child: topRatedTVs.when(
        data: (tvs) {
          if (tvs.isEmpty) {
            return const Center(
              child: Text('No top rated tv show found.'),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TVList(tvList: tvs),
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar('Could not get top rated tv shows');

          return Center(
            child: ErrorText(localization.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
