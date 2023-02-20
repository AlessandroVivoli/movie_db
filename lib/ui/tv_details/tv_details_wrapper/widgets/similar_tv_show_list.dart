import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/tv_list/tv_list.dart';
import '../../../../features/tv_shows/provider/get_similar_tv_shows_provider.dart';

class SimilarTVShowList extends StatelessWidget {
  const SimilarTVShowList({super.key, required this.tvId});

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Similar TV Shows'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _SimilarTVShowsBuilder(tvId: tvId),
          ),
        )
      ],
    );
  }
}

class _SimilarTVShowsBuilder extends ConsumerWidget {
  final int tvId;

  const _SimilarTVShowsBuilder({required this.tvId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarTVShowsList = ref.watch(getSimilarTVShowsProvider(tvId));

    return similarTVShowsList.when(
      data: (similarTVShows) {
        if (similarTVShows.isEmpty) {
          return const Center(
            child: Text('No similar tv show found.'),
          );
        }

        return TVList(
          tvList: similarTVShows,
          padding: 10,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar('Could not get similar tv shows.');

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
